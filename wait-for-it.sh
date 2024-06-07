#!/usr/bin/env bash
# wait-for-it.sh

set -e

host="$1"
shift
cmd="$@"
timeout=120
start_time=$(date +%s)

echo "Waiting for MySQL to be available at $host..."

until mysql -h "$host" -u root -proot -e 'SELECT 1' &> /dev/null; do
  >&2 echo "MySQL is unavailable - sleeping"
  sleep 5

  current_time=$(date +%s)
  elapsed_time=$((current_time - start_time))
  
  if [ $elapsed_time -ge $timeout ]; then
    >&2 echo "MySQL is still unavailable after $timeout seconds, exiting."
    exit 1
  fi
done

>&2 echo "MySQL is up - executing command"
exec $cmd
