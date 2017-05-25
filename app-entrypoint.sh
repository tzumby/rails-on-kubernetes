#!/bin/bash

set -e

echo "Starting Rails on port 3000"

exec bundle exec rails s -p 3000 -b 0.0.0.0
