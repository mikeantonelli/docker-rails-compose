#!/bin/bash
# wait-for-mysql.sh
#
# This file is used by docker-compose to more tightly control start-up order.
# We want to ensure that mysql is running before attempting to run a command which
# relies on the datbase (e.g. migration).
#
# See Docker's documentation for more info: https://docs.docker.com/compose/startup-order/

set -e
cmd="$@"

until mysql -h "$DATABASE_HOST" -u "$DATABASE_USERNAME" --password="$DATABASE_PASSWORD"; do
  >&2 echo "MySQL is unavailable - sleeping"
  sleep 1
done

>&2 echo "MySQL is up - executing command"
exec $cmd
