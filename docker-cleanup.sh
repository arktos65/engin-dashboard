#!/usr/bin/env bash
# docker-cleanup.sh
#
# This utility script cleans up unused Docker containers and prunes dangling images.
#
echo "...Starting Docker environment cleanup"
date

# Generate a list of active containers
echo ".....Active containers"
docker ps

# Generate a list of installed images
echo ".....Installed images"
docker images

# Delete all stopped containers
echo ".....Deleting all stopped containers"
docker ps -q -f status=exited | xargs docker rm

# Delete all dangling (unused) images
echo ".....Deleting all dangling images"
docker images -q -f dangling=true | xargs docker rmi

echo "...Docker environment cleanup finished"
