#!/bin/bash
set -e

# Check if the server PID file exists, and delete it if it does
rm -f /app/tmp/pids/server.pid

# If running the rails server then create or migrate existing database
if [ "${3}" == "rails" ]; then
  bundle exec rails db:prepare
fi

# # Execute the command given as arguments (e.g., `rails server`)
exec "$@"