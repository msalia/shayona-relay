###################
# BUILD FOR PRODUCTION
###################

# syntax=docker/dockerfile:1.4
FROM rustlang/rust:nightly AS base

ARG NAME

RUN cargo install diesel_cli --no-default-features --features mysql

WORKDIR /$NAME

RUN cargo init
COPY Cargo.toml /$NAME/Cargo.toml

RUN cargo fetch
COPY . /$NAME

FROM base AS development

ARG HOST
ARG PORT
ARG METRICS_PORT

EXPOSE $HOST
EXPOSE $PORT
EXPOSE $METRICS_PORT

CMD [ "cargo", "run", "--offline" ]

FROM base AS dev-envs

ARG HOST
ARG PORT
ARG METRICS_PORT

EXPOSE $HOST
EXPOSE $PORT
EXPOSE $METRICS_PORT

RUN apt-get update && apt-get install -y --no-install-recommends git

RUN <<EOF
useradd -s /bin/bash -m vscode
groupadd docker
usermod -aG docker vscode
EOF

# install Docker tools (cli, buildx, compose)
COPY --from=gloursdocker/docker / /
CMD [ "cargo", "run", "--offline" ]

FROM base AS builder

RUN apt-get update && \
    apt-get install -y cmake libclang-dev clang libtirpc-dev default-libmysqlclient-dev && \
    cargo build --release && \
    apt-get clean

###################
# PRODUCTION
###################

FROM rustlang/rust:nightly

ARG NAME
ARG HOST
ARG PORT
ARG METRICS_PORT

EXPOSE $HOST
EXPOSE $PORT
EXPOSE $METRICS_PORT

COPY --from=builder /$NAME/target/release/$NAME /docker_executer

CMD [ "/docker_executer" ]
