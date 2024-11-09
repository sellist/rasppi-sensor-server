FROM postgres:latest

COPY *.sql /docker-entrypoint-initdb.d/

# Expose PostgreSQL default port
EXPOSE 5432

# Set the default command to start PostgreSQL
CMD ["postgres"]