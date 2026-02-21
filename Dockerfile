# Use a base image configured for Windows cross-compilation
# An example image can be found on Docker Hub
FROM jscharnitzke/rust-build-windows:latest AS windows-builder

# Set the working directory inside the container
WORKDIR /usr/src/relay

# Copy your project code into the container
COPY . .

# Build the Rust project for the Windows target
# The image is pre-configured to use the correct toolchain
RUN cargo build --release --target=x86_64-pc-windows-msvc