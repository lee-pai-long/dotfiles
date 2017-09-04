# Get a container IP using container ID
docker-ip() {
    sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$@";
}
