# remove old container and dependencies
docker compose down
docker image rm shayona-relay

# build images
docker compose -f docker-compose.yaml build

# push docker images to hub
docker image tag shayona-kiosk-relay-relay msalia/shayona-relay:latest
docker push msalia/shayona-relay:latest