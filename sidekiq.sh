#!/bin/bash

set -e

echo "Waiting for Redis to start..."

while ! nc -z redis 6379; do sleep 0.1; done

echo "Redis is up - executing command"

exec bundle exec sidekiq -C config/sidekiq.yml
