from fastapi import APIRouter,status,Response,Query
from pydantic import BaseModel
from db.models import Likes,Customer,Product
from db.db_config import session
from sqlalchemy.sql.expression import and_
from typing import Optional


router = APIRouter(prefix='/product' , tags=['product'])





@router.get("/pid{pid}", status_code=status.HTTP_200_OK)
def get_product_by_id(pid:int,response:Response):

    product = session.query(Product).filter(Product.pid==pid).first()
    if(product is None):
        response.status_code = status.HTTP_404_NOT_FOUND
        return {"error": "ویلای مورد نظر یافت نشد"}

    return product\

@router.get("/page{page}", status_code=status.HTTP_200_OK)
def get_product_paging(page:int,response:Response):

    products = session.query(Product).offset((page-1)*15).limit(15).all()
    if(products is None):
        response.status_code = status.HTTP_404_NOT_FOUND
        return {"message": "ویلایی در این صفحه موجود نیست"}

    return products



@router.get("/getall", status_code=status.HTTP_200_OK)
def get_all_products(limit:Optional[int] = 8):


    products = session.query(Product).limit(limit).all()


    if(products is None):
        return {"message": "ویلایی موجود نمی باشد"}

    return products

@router.get("/getexpencive", status_code=status.HTTP_200_OK)
def getexpencive(limit:Optional[int] = 8):


    products = session.query(Product).order_by(Product.price).limit(limit).all()


    if(products is None):
        return {"message": ",ویلایی موجود نمی باشد"}

    return products

@router.get("/getcheapproducts", status_code=status.HTTP_200_OK)
def getcheapproducts(limit:Optional[int] = 8):


    products = session.query(Product).order_by(Product.price.desc()).limit(limit).all()


    if(products is None):
        return {"message": ",ویلایی موجود نمی باشد"}

    return products



