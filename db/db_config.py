from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
import redis

DB_HOST = "astronic_project-db-1"
# DB_HOST = "127.0.0.1"
DB_PORT = "3306"
DB_USER = "root"
DB_PASSWORD = "66405206"
DATABASE = "astronic"

RDS_HOST = "astronic_project-redis-1"
# RDS_HOST = "127.0.0.1"
RDS_PORT = "6379"
RDS_PASSWORD = "66405206"

engine = create_engine(
    f"mariadb+mariadbconnector://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DATABASE}?charset=utf8")
# engine = create_engine(f"mysql+pymysql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DATABASE}?charset=utf8")
session = sessionmaker(bind=engine)()

rds = redis.Redis(host=RDS_HOST, port=RDS_PORT)
