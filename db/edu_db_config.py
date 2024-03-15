# import mysql.connector
from sqlalchemy import create_engine
from sqlalchemy import Column, Integer, String,BigInteger,Text,ForeignKey
from sqlalchemy.orm import declarative_base
from sqlalchemy.orm import sessionmaker
from sqlalchemy.sql.expression import and_ , or_
from sqlalchemy.orm import relationship
import redis

DB_HOST = "localhost"
DB_PORT = "3306"
DB_USER = "root"
DB_PASSWORD = ""
DATABASE = "villla"



# mydb = mysql.connector.connect(
#   host=DB_HOST,
#   user=DB_USER,
#   password=DB_PASSWORD,
#   database=DATABASE
# )
# mycursor.execute("CREATE DATABASE villla")

engine = create_engine(f"mysql+pymysql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DATABASE}?charset=utf8" )
# , echo=True
base = declarative_base()
session = sessionmaker(bind=engine)()


class Product(base):
  __tablename__ = "products"
  _pid = Column('pid' , Integer,unique=True,primary_key=True)
  title = Column('title', String(255))
  price = Column('price', BigInteger,default=0)
  _addressid = Column('addressid', Integer,unique=True)
  roomcount = Column('roomcount', Integer,nullable=True)
  area = Column('area', Integer,nullable=True)
  description = Column('description', Text)
  _ownerid = Column('oid', Integer,ForeignKey('owners.oid'))
  likes = Column('likes', Integer,default=0)


class Owner(base):
  __tablename__ = "owners"
  _oid = Column('oid' , Integer,unique=True,primary_key=True)
  username = Column('username', String(50),unique=True,nullable=True)
  password = Column('pass', String(128))
  firstname = Column('firstname', String(255))
  lastname = Column('lastname', String(255))
  phonenumber = Column('phonenumber', String(11),unique=True)
  nationalcode = Column('nationalcode', String(10),unique=True)
  cardnumber = Column('cardnumber', String(16))
  products = relationship('Product',backref='owner')




base.metadata.create_all(engine)

products = session.query(Product).filter(Product.title=='ghasr abi').order_by(Product.title).first()
#.all()

# for product in products:
print(products.title)

#insert
# product_1 = Product(title = "sarhammom villa",_addressid=22,description = "in sarhamoom city",_ownerid = 1 )
#
# session.add(product_1)
# session.commit()

# session.add_all([product_1,product_2])
# session.commit()
#delete
#
# product_d = session.query(Product).filter(Product.title=='sarhammom villa').\
#   order_by(Product.title).first()
# session.delete(product_d)
# session.commit()

product_d = session.query(Product).filter(Product.title=='sarhammom villa')\
  .delete()
session.commit()

print(product_d)

#update

# product_u = session.query(Product).filter(Product.title=="ghasr3").\
#   update({"title":"ghasr3"})
# session.commit()
# print(product_u)

# product_u2= session.query(Product).filter(Product.title=="ghasr3").first()
# product_u2.title = "ghasr2"
# session.commit()

# aliRudi = Owner(username="aligholami", password="1234", firstname="ali",
#                lastname="rudi",phonenumber="09111111212", nationalcode="4980372127",
#                cardnumber="6037603760376037")
# session.add(aliRudi)
# session.commit()

#relation add

aliRudi = session.query(Owner).filter(Owner._oid==1).first()
#
# product_ali = Product(title = "sar villa",_addressid=22,
#                     description = "in sarhamoom city2",
#                     owner=aliRudi)
# session.add(product_ali)
# session.commit()


#relation select


print(aliRudi.products[0].title)






