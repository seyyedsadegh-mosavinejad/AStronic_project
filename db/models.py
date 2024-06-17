from sqlalchemy import Column, Integer, URL, String, BigInteger, Text, ForeignKey, Boolean, Date
from sqlalchemy.orm import declarative_base
from sqlalchemy.orm import relationship


base = declarative_base()


class User(base):
  __tablename__ = "users"
  uid = Column('uid', Integer, primary_key=True)
  phonenumber = Column('phonenumber', String(11), unique=True)
  password = Column('password', String(128))
  username = Column('username', String(50),nullable=True)
  email = Column('email', String(255),nullable=True)
  isModir = Column("ismodir", Boolean, default=False)
  firstname = Column('firstname', String(255), nullable=True)
  lastname = Column('lastname', String(255), nullable=True)

  nationalcode = Column('nationalcode', String(10), nullable=True)
  cardnumber = Column('cardnumber', String(16), nullable=True)

  sefareshha = relationship("Sefaresh", back_populates="user")
  cart = relationship("Cart", back_populates="user")
  addresses = relationship("Address", back_populates="user")
    # isowner = Column('isowner', Boolean, default=False)
    # completed = Column('completed', Boolean, default=False)

    # likes = relationship('Likes',backref='customer')
    # products = relationship('Product', backref='owner')
    # addresses = relationship('Address', backref='owner')
    # rents = relationship('Rent', backref='renter')


class Category(base):
  __tablename__ = "categories"
  categoryid = Column('categoryid', Integer, primary_key=True)
  category = Column('category', String(255))
  subCategories = relationship("SubCategory", back_populates="category")
  products = relationship("Product", back_populates="category")
class SubCategory(base):
  __tablename__ = "subcategories"
  scid = Column('scid', Integer, primary_key=True)
  subcategory = Column('subcategory', String(200))
  categoryid = Column('categoryid', Integer, ForeignKey("categories.categoryid"))
  category = relationship("Category", back_populates="subCategories")
  products = relationship("Product", back_populates="subCategory")


class Product(base):
  __tablename__ = "products"
  pid = Column('pid' , Integer,primary_key=True)
  title = Column('title', String(255))
  model = Column('model', String(255))
  price = Column('price', BigInteger,default=0)
  description = Column('description', Text)
  categoryid = Column('categoryid', Integer, ForeignKey("categories.categoryid"))
  scid = Column('scid', Integer, ForeignKey("subcategories.scid"))
  category = relationship("Category", back_populates="products")
  subCategory = relationship("SubCategory", back_populates="products")
  subProducts = relationship("SubProduct", back_populates="product")

class SubProduct(base):
  __tablename__ = "subproduct"
  spid = Column('spid' , Integer,primary_key=True)
  pid = Column('pid' , Integer, ForeignKey("products.pid"))
  price = Column('price', BigInteger,default=0)
  mojoodi = Column('mojoodi', Integer,default=0)
  color = Column('color', String(20),default=0)
  color_name = Column('colorname', String(30),default=0)
  product = relationship("Product", back_populates="subProducts")
  sefareshRows = relationship("SefareshRow", back_populates="subProduct")
  carts = relationship("Cart", back_populates="subProduct")
class Sefaresh(base):
  __tablename__ = "safaresh"
  sid = Column('sid' , Integer,primary_key=True)
  uid = Column('uid' , Integer, ForeignKey("users.uid"))
  addressid = Column('addressid' , Integer, ForeignKey("addresses.addressid"))
  raveshErsalid = Column('raveshersalid' , Integer, ForeignKey("raveshersals.raveshersalid"))
  statusid = Column('statusid' , Integer, ForeignKey("statuses.statusid"))
  date = Column('date' , Date)
  mablaq = Column('mablaq' , String(20))

  user = relationship("User", back_populates="sefareshha")
  address = relationship("Address", back_populates="sefareshha")
  raveshErsal = relationship("Raveshersal", back_populates="sefareshha")
  status = relationship("Status", back_populates="sefareshha")
  rows = relationship("SefareshRow", back_populates="sefaresh")
class Status(base):
  __tablename__ = "statuses"
  statusid = Column('statusid' , Integer,primary_key=True)
  status = Column('status' , String(100))

  sefareshha = relationship("Sefaresh", back_populates="status")


class SefareshRow(base):
  __tablename__ = "sefareshrow"
  srid = Column('srid' , Integer,primary_key=True)
  sid = Column('sid' , Integer, ForeignKey("safaresh.sid"))
  spid = Column('spid' , Integer, ForeignKey("subproduct.spid"))
  tedad = Column('tedad' , Integer)
  price = Column('price' , Integer)
  totalPrice = Column('total price' , Integer)

  sefaresh = relationship("Sefaresh", back_populates="rows")
  subProduct = relationship("SubProduct", back_populates="sefareshRows")
class Raveshersal(base):
  __tablename__ = "raveshersals"
  raveshersalid = Column('raveshersalid' , Integer,primary_key=True)
  raveshersal = Column('raveshersal' , String(100))

  sefareshha = relationship("Sefaresh", back_populates="raveshErsal")


class Cart(base):
  __tablename__ = "cart"
  cid = Column('cid' , Integer,primary_key=True)
  uid = Column('uid' , Integer, ForeignKey("users.uid"))
  spid = Column('spid' , Integer, ForeignKey("subproduct.spid"))
  tedad = Column('tedad' , Integer)
  user = relationship("User", back_populates="cart")
  subProduct = relationship("SubProduct", back_populates="carts")

#

class Address(base):
  __tablename__ = "addresses"
  addressid = Column('addressid' , Integer,unique=True,primary_key=True)
  ostan = Column('ostan', String(100))
  shahr = Column('shahr', String(100))
  pelak = Column('pelak', String(10))
  address = Column('address', Text)
  phone = Column('phone', String(20))
  postalcode = Column('postalcode', String(20))
  location = Column('location', Text)
  uid = Column('uid', Integer, ForeignKey('users.uid'))

  sefareshha = relationship("Sefaresh", back_populates="address")
  user = relationship("User", back_populates="addresses")
#
# class Customer(base):
#   __tablename__ = "customers"
#   cid = Column('cid' , Integer,unique=True,primary_key=True)
#   username = Column('username', String(50),nullable=True)
#   email = Column('email', String(150),nullable=True)
#   password = Column('pass', String(128))
#   firstname = Column('firstname', String(255))
#   lastname = Column('lastname', String(255))
#   phonenumber = Column('phonenumber', String(11),unique=True)
#   nationalcode = Column('nationalcode', String(10))
#   cardnumber = Column('cardnumber', String(16))
#   isowner = Column('isowner', Boolean, default=False)
#   completed = Column('completed', Boolean, default=False)
#
#   likes = relationship('Likes',backref='customer')
#   products = relationship('Product', backref='owner')
#   addresses = relationship('Address', backref='owner')
#   rents = relationship('Rent', backref='renter')
#

#
#
# class Likes(base):
#   __tablename__ = "likes"
#   lid = Column('lid', Integer, unique=True, primary_key=True)
#   cid = Column('cid', Integer, ForeignKey('customers.cid'))
#   pid = Column('pid', Integer, ForeignKey('products.pid'))
#
#
# class Product(base):
#   __tablename__ = "products"
#   pid = Column('pid' , Integer,unique=True,primary_key=True)
#   oid = Column('oid', Integer, ForeignKey('customers.cid'))
#   title = Column('title', String(255))
#   price = Column('price', BigInteger,default=0)
#   addressid = Column('addressid', Integer, ForeignKey('addresses.addressid'))
#   roomcount = Column('roomcount', Integer,nullable=True)
#   description = Column('description', Text)
#   tedadlikes = Column('tedadlikes', Integer,default=0)
#   tedadaks = Column('tedadaks', Integer)
#   salsakht = Column('salsakht', Integer)
#   nomantaghe = Column('nomantaghe', String(100))
#   noeghamatgah = Column('noeghamatgah', String(100))
#   masahatzamin = Column('masahatzamin',Integer)
#   masahatsakhtaman = Column('masahatsakhteman',Integer)
#   zarfiatstandard = Column('zarfiatstandard',Integer)
#   zarfiathadaksar = Column('zarfiathadaksar',Integer)
#   tedadhamam = Column('tedadhamam',Integer)
#   emkanat = Column('emkanat',Text)
#   taeed = Column('taeed', Boolean, default=False)
#   isrent = Column('isrent', Boolean, default=False)
#   liked = relationship('Likes', backref='product')
#   rents = relationship('Rent', backref='product')
#
#
#
# class Admin(base):
#   __tablename__ = "admins"
#   aid = Column('aid' , Integer,unique=True,primary_key=True)
#   username = Column('username', String(50),nullable=True)
#   password = Column('password', String(128))
#   name = Column('name', String(255))
#   phonenumber = Column('phonenumber', String(11),unique=True)
#   nationalcode = Column('nationalcode', String(10))
#
# class Rent(base):
#   __tablename__ = "rents"
#   rid = Column('rid', Integer, primary_key=True, unique=True)
#   cid = Column('cid', Integer, ForeignKey('customers.cid'))
#   pid = Column('pid', Integer, ForeignKey('products.pid'))
#   startdate = Column('startdate', String(100))
#   endtdate = Column('enddate', String(100))
