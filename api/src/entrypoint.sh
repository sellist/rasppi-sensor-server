#!/bin/sh

echo "Starting entrypoint.sh"

if [ -z "$POSTGRES_USER" ] || [ -z "$POSTGRES_PASSWORD" ] || [ -z "$POSTGRES_DB" ]; then
    echo "Please set the POSTGRES_USER, POSTGRES_PASSWORD, and POSTGRES_DB environment variables."
    exit 1
fi

# check if this script is in correct directory
cd "$(dirname "$0")" || exit

# wait for db to be ready
echo "Waiting for postgres..."
sleep 5

echo "Apply database migrations"
python manage.py makemigrations

# Start running the server
python manage.py runserver 0.0.0.0:8000