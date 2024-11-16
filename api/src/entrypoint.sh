#!/bin/sh

echo "Starting entrypoint.sh"

if [ -z "$SQL_USER" ] || [ -z "$SQL_PASSWORD" ] || [ -z "$SQL_DATABASE" ]; then
    echo "Please set the SQL_USER, SQL_PASSWORD, and SQL_DATABASE environment variables."
    exit 1
fi

# check if this script is in correct directory
cd "$(dirname "$0")" || exit

# wait for db to be ready
echo "Waiting for database..."
sleep 5

echo "Apply database migrations"
python manage.py makemigrations

# Start running the server
python manage.py runserver 0.0.0.0:8000