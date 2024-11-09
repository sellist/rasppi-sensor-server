#!/bin/sh

sudo apt-get install docker

if [ -z "$POSTGRES_USER" ] || [ -z "$POSTGRES_PASSWORD" ] || [ -z "$POSTGRES_DB" ]; then
    echo "Please set the POSTGRES_USER, POSTGRES_PASSWORD, and POSTGRES_DB environment variables."
    exit 1
fi

# check if this script is in correct directory

cd "$(dirname "$0")" || exit
cd ..

if [ ! -d ".git" ]; then
    echo "This script must be run from the scripts directory"
    exit 1
fi

git pull

if ! systemctl is-active --quiet docker; then
    echo "Starting Docker..."
    sudo systemctl start docker
fi

docker-compose -f ./scripts/compose.yml up -d
