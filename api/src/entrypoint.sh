# check for env variables
if [ -z "$POSTGRES_USER" ] || [ -z "$POSTGRES_PASSWORD" ] || [ -z "$POSTGRES_DB" ]; then
    echo "Please set the POSTGRES_USER, POSTGRES_PASSWORD, and POSTGRES_DB environment variables."
    exit 1
fi

# check if this script is in correct directory
cd "$(dirname "$0")" || exit

nohup python manage.py runserver 0.0.0.0:8000 &