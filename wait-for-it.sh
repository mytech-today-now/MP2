#!/usr/bin/env bash
# wait-for-it.sh

set -e

host="$1"
shift
cmd="$@"
timeout=${WAIT_FOR_IT_TIMEOUT:-120}
mysql_user=${MYSQL_USER:-root}
mysql_password=${MYSQL_PASSWORD:-root}
start_time=$(date +%s)

echo "Waiting for MySQL to be available at $host with timeout of $timeout seconds..."

until mysql -h "$host" -u "$mysql_user" -p"$mysql_password" -e 'SELECT 1' &> /dev/null; do
  >&2 echo "MySQL is unavailable - sleeping..."
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
