import mariadb
import os
import random
import sys

def rword():
    return ''.join([random.choice('sdnufdfsdier') for i in range(32)])

def main(db_config):
    conn = None
    cursor = None
    try:
        with mariadb.connect(**db_config) as conn:
            with conn.cursor() as cursor:
                sql = "CREATE TABLE mydata ( name CHAR(32), count INT )"
                cursor.execute(sql)
                conn.commit()
                sql = "INSERT INTO mydata (name, count) VALUES (?,?)"
                for k in range(1000):
                    data = (rword(), k)
                    cursor.execute(sql, data)
                conn.commit()
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
