docker kill $(docker ps -aq)
docker rm -f $(docker ps -aq)
