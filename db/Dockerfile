FROM postgres:latest

RUN apt-get update && \
    apt-get install -y python3 python3-pip

RUN pip3 install alembic

COPY alembic.ini /app/alembic.ini
COPY alembic /app/alembic

WORKDIR /app

EXPOSE 5432

CMD ["postgres"]