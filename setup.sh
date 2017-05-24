#!/bin/bash

set -e

echo "Waiting for Postgres to start..."

while ! nc -z db 5432; do sleep 0.1; done

echo "Postgres is up - executing command"

exec bin/rails db:migrate
