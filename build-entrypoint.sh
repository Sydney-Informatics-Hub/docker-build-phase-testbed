#!/usr/bin/env bash


set -euo pipefail

sleep 2

echo "Running build script"

export MARIADB_DATABASE=$(</run/secrets/db_database)
export MARIADB_USER=$(</run/secrets/db_user)
export MARIADB_PASSWORD=$(</run/secrets/db_password)

/opt/init_py/bin/python /opt/init_py/initialise_db.py

echo "Dumping SQL"

mariadb-dump --host $MARIADB_HOST --user $MARIADB_USER -p$MARIADB_PASSWORD --all-databases > /output/init-db.sql

echo "Build complete, apache shut down"
