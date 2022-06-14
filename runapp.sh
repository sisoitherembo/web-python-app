#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for PostgreSQL..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
        sleep 0.1
    done

    echo "PostgreSQL started!!"
fi

if [ "$FLUSH_DB" = "1" ]
then
    echo "Migrating DB..."
    python manage.py flush --no-input
    python manage.py migrate
    echo "Migration complete!!"
fi

exec "$@"