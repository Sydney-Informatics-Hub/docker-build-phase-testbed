#!/usr/bin/env bash


set -euo pipefail

#apache2-foreground &
#APACHE_PID = $!

sleep 2

echo "Running build script..."

export MARIADB_DATABASE=$(</run/secrets/db_database)
export MARIADB_USER=$(</run/secrets/db_user)
export MARIADB_PASSWORD=$(</run/secrets/db_password)

/opt/init_py/bin/python /opt/init_py/initialise_db.py


#kill $APACHE_PID
#wait $APACHE_PID 2>/dev/null || true

echo "Build complete, apache shut down"
