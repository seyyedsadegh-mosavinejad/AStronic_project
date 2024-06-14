from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
import redis
import pymongo



# DB_HOST = "astronic_project-db-1"
DB_HOST = "127.0.0.1"
DB_PORT = "33060"
DB_USER = "root"
DB_PASSWORD = "66405206"
DATABASE = "astronic"

# RDS_HOST = "astronic_project-redis-1"
RDS_HOST = "127.0.0.1"
RDS_PORT = "63790"
RDS_PASSWORD = "66405206"

MGDB_HOST = "127.0.0.1"
# MGDB_HOST = "astronic_project-mongodb-1"
MGDB_PORT = "27017"
MGDB_USER = "root"
MGDB_PASS = "66405206"

mymongo = pymongo.MongoClient(f"mongodb://{MGDB_USER}:{MGDB_PASS}@{MGDB_HOST}:{MGDB_PORT}/")

mgdb = mymongo["astronic"]


engine = create_engine(
    f"mariadb+mariadbconnector://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DATABASE}?charset=utf8")
# engine = create_engine(f"mysql+pymysql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DATABASE}?charset=utf8")
session = sessionmaker(bind=engine)()

rds = redis.Redis(host=RDS_HOST, port=RDS_PORT)
