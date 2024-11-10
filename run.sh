#!/bin/sh

sudo apt-get install docker

if [ -z "$POSTGRES_USER" ] || [ -z "$POSTGRES_PASSWORD" ] || [ -z "$POSTGRES_DB" ]; then
    echo "Please set the POSTGRES_USER, POSTGRES_PASSWORD, and POSTGRES_DB environment variables."
    exit 1
fi

# check if this script is in correct directory

cd "$(dirname "$0")" || exit

if [ ! -d ".git" ]; then
    echo "This script must be run from the scripts directory"
    exit 1
fi

if ! systemctl is-active --quiet docker; then
    echo "Starting Docker..."
    sudo systemctl start docker
fi

if ! systemctl is-active --quiet docker; then
    echo "Docker failed to start"
    exit 1
fi

if ! docker --version; then
    echo "Docker is not installed"
    exit 1
fi

if ! docker-compose --version; then
    echo "Docker Compose is not installed"
    exit 1
fi

# bring old images down if any
docker-compose -f compose.yml down

# pull the latest changes
git pull

# build the images
docker-compose -f compose.yml build

# run the containers
docker-compose -f compose.yml up -d

# delete old images only if they are api or db images
docker image prune -f --filter "label=service=api"
docker image prune -f --filter "label=service=db"
