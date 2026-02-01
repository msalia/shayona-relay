# remove old container and dependencies
docker compose down
docker image rm shayona-relay

# start a new container
docker compose -f docker-compose.prod.yaml up -d