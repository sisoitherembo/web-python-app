#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for PostgreSQL..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
        sleep 0.1
    done

    echo "PostgreSQL started!!"
fi

if [ "$INIT_STATIC_FILES" = "1"]
then
    echo "Collecting static files..."
    python manage.py collectstatic
    echo "Collecting of the static files completed!!"
fi

if [ "$FLUSH_DB" = "1" ]
then
    echo "Migrating DB..."
    python manage.py flush --no-input
    python manage.py migrate
    echo "Migration complete!!"
fi

exec "$@"