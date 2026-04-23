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
    except Exception as e:
        print("Connection failed")
        print(e)

if __name__ == "__main__":
    db_config = {
        'host': os.environ['MARIADB_HOST'],
        'port': int(os.environ['MARIADB_PORT']),
        'database': os.environ['MARIADB_DATABASE'],
        'user': os.environ['MARIADB_USER'],
        'password': os.environ['MARIADB_PASSWORD'],
    }
    main(db_config)
