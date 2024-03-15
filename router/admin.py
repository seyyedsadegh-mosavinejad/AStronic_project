from fastapi import Depends, APIRouter, status, Response
from schemas import CreateVilllaBase, CreateVilllaBase, CustomerAuth, CreateAddressBase
from typing import Annotated
from auth.oauth2 import get_current_active_customer
from db.db_customer import get_customer_by_phone
from functions.validation import *
from db.models import Product, Address, Admin
from db.db_config import session


router = APIRouter(prefix='/admin' , tags=['admin'])

@router.post('/taeed-villla')
def taeed_villla(pid: int, response:Response, current_customer: Annotated[CustomerAuth, Depends(get_current_active_customer)]):
    phone = current_customer.get('sub')
    admin = session.query(Admin).filter(Admin.phonenumber == phone).first()
    if admin is None:
        response.status_code = status.HTTP_400_BAD_REQUEST
        return {
            "message": "کار بر عادی توانایی این کار را ندارد"
        }
    product = session.query(Product).filter(Product.pid == pid).first()
    if product is None:
        response.status_code = status.HTTP_400_BAD_REQUEST
        return {
            "message": "ویلای مورد نظر یافت نشد"
        }
    if product.taeed:
        product.taeed= False
        session.commit()
        return {
            "message": "تایید ویلای مورد به غیر فعال شد "
        }
    product.taeed = True
    session.commit()
    return {
        "message": "ویلای مورد نظر فعال شد"
    }

@router.post('/update-villla')
def ipdate_villla(pid: int,productbase: CreateVilllaBase, response:Response, current_customer: Annotated[CustomerAuth, Depends(get_current_active_customer)]):
    phone = current_customer.get('sub')
    admin = session.query(Admin).filter(Admin.phonenumber == phone).first()
    if admin is None:
        response.status_code = status.HTTP_400_BAD_REQUEST
        return {
            "message": "کار بر عادی توانایی این کار را ندارد"
        }
    product = session.query(Product).filter(Product.pid == pid).first()
    if product is None:
        response.status_code = status.HTTP_400_BAD_REQUEST
        return {
            "message": "ویلای مورد نظر یافت نشد"
        }
    try:

        product.title=productbase.title
        product.price=productbase.price
        product.addressid=productbase.addressid
        product.roomcount=productbase.roomcount
        product.description=productbase.description
        product.tedadaks=productbase.tedadaks
        product.salsakht=productbase.salsakht
        product.nomantaghe=productbase.nomantaghe
        product.noeghamatgah=productbase.noeghamatgah
        product.masahatzamin=productbase.masahatzamin
        product.masahatsakhtaman=productbase.masahatsakhtaman
        product.zarfiatstandard=productbase.zarfiatstandard
        product.zarfiathadaksar=productbase.zarfiathadaksar
        product.tedadhamam=productbase.tedadhamam
        product.emkanat=productbase.emkanat

        session.commit()
        session.refresh(product)

    except:
        response.status_code = status.HTTP_400_BAD_REQUEST
        return {"message": "ورودی های نا معتبر"}

    return {
        "message": "ویلای مورد نظر تغییر یافت",
        "pid": product.pid
    }

@router.post('/delete-villla')
def delete_villla(pid: int, response:Response, current_customer: Annotated[CustomerAuth, Depends(get_current_active_customer)]):
    phone = current_customer.get('sub')
    admin = session.query(Admin).filter(Admin.phonenumber == phone).first()
    if admin is None:
        response.status_code = status.HTTP_400_BAD_REQUEST
        return {
            "message": "کار بر عادی توانایی این کار را ندارد"
        }
    product = session.query(Product).filter(Product.pid == pid).first()
    if product is None:
        response.status_code = status.HTTP_400_BAD_REQUEST
        return {
            "message": "ویلای مورد نظر یافت نشد"
        }
    session.delete(product)
    session.commit()


    return {
        "message": "ویلای مورد نظر حذف شد",
        "pid": pid
    }

