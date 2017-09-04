# Get a container IP using container ID
#
# Usage: docker-ip <container-id>|<container-name>
docker-ip() {
    docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$@";
}
