#!/bin/sh

sudo apt-get install docker

if [ -z "$POSTGRES_USER" ] || [ -z "$POSTGRES_PASSWORD" ] || [ -z "$POSTGRES_DB" ]; then
    echo "Please set the POSTGRES_USER, POSTGRES_PASSWORD, and POSTGRES_DB environment variables."
    exit 1
fi

if [ ! -d ".git" ]; then
    echo "This script must be run from the root of the repository."
    exit 1
fi

git pull

git fetch --tags
latestTag=$(git describe --tags `git rev-list --tags --max-count=1`)
echo "Latest tag: $latestTag"

git checkout $latestTag

if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker and try again."
    exit 1
fi

if ! systemctl is-active --quiet docker; then
    echo "Starting Docker..."
    sudo systemctl start docker
fi

docker build -t api -f Dockerfile .
docker build -t db -f Dockerfile .

docker stop db api
docker rm db api

docker-compose -f docker-compose.yml up -d

docker rmi "$(docker images -f "dangling=true" -q)"