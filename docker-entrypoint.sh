#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

echo "Waiting for Postgres to start..."
while ! nc -z postgres 5432; do sleep 0.1; done
echo "Postgres is up"

echo "Waiting for Redis to start..."
while ! nc -z redis 6379; do sleep 0.1; done
echo "Redis is up - execuring command"

exec bundle exec "$@"
