import mariadb
import os
import sys

def main(db_config):
    conn = None
    cursor = None
    try:
        print("Connecting to MariaDB...")
        conn = mariadb.connect(**db_config)
        print("Connection successful!")

        cursor = conn.cursor()


if __name__ == "__main__":
    db_config = {
        'host': os.environ['MARIA_HOST'],
        'port': 3306,
        'user': os.environ['MARIADB_USER'],
        'database': os.environ['MARIADB_DATABASE'],
        'password': os.environ['MARIADB_PASSWORD'],
    }
    main(db_config)
