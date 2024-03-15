from fastapi import File, UploadFile, Depends, APIRouter, status, Response
from schemas import CreateVilllaBase, CustomerAuth, CreateAddressBase
from typing import Annotated
from auth.oauth2 import get_current_active_customer
from db.db_customer import get_customer_by_phone
from functions.validation import *
from db.models import Product, Address, Customer
from db.db_config import session
import shutil
import os

router = APIRouter(prefix='/owner' , tags=['owner'])

@router.post('get-my-villlas')
def get_villlas(response:Response, current_customer: Annotated[CustomerAuth, Depends(get_current_active_customer)]):
    phone = current_customer.get('sub')
    customer = get_customer_by_phone(phone)
    products = customer.products
    if products is None:
        response.status_code = status.HTTP_404_NOT_FOUND
        return {"message": "شما ویلایی ثبت نکرده اید"}
    return products

@router.post('create-villla')
def create_villla(productbase: CreateVilllaBase, response:Response,
                   current_customer: Annotated[CustomerAuth, Depends(get_current_active_customer)]):
    owner = get_customer_by_phone(current_customer.get('sub'))
    if not owner.isowner:
        response.status_code = status.HTTP_400_BAD_REQUEST
        return {
            "message": "کاربر عادی توانایی ثبت آگهی نخواهد داشت"
        }
    if not is_Text(productbase.title):
        response.status_code = status.HTTP_400_BAD_REQUEST
        return {"message": "محتوای عنوان مجاز نمی باشد"}
    if not is_Text(productbase.description):
        response.status_code = status.HTTP_400_BAD_REQUEST
        return {"message": "محتوای توضیحات مجاز نمی باشد"}
    if not isinstance(productbase.price, int):
        response.status_code = status.HTTP_400_BAD_REQUEST
        return {"message": "قیمت باید عددی بر حسب تومان باشد"}

    if not isinstance(productbase.roomcount, int):
            response.status_code = status.HTTP_400_BAD_REQUEST
            return {"message": "قیمت تعداد اتاق"}
    if not is_Text(productbase.title):
        response.status_code = status.HTTP_400_BAD_REQUEST
        return {"message": "محتوای عنوان مجاز نمی باشد"}

    try:
        product = Product(
            oid=owner.cid,
            title = productbase.title,
            price = productbase.price,
            addressid = productbase.addressid,
            roomcount = productbase.roomcount,
            description = productbase.description,
            tedadaks = 0,
            salsakht = productbase.salsakht,
            nomantaghe = productbase.nomantaghe,
            noeghamatgah = productbase.noeghamatgah,
            masahatzamin = productbase.masahatzamin,
            masahatsakhtaman = productbase.masahatsakhtaman,
            zarfiatstandard = productbase.zarfiatstandard,
            zarfiathadaksar = productbase.zarfiathadaksar,
            tedadhamam = productbase.tedadhamam,
            emkanat = productbase.emkanat
        )
        session.add(product)
        session.commit()
        session.refresh(product)

    except:
        response.status_code = status.HTTP_400_BAD_REQUEST
        return {"message":"ورودی های نا معتبر"}


    return {
        "message": "محصول مورد نظر با موفقیت ثبت شد و پس از تایید منتشر می شود",
        "pid": product.pid
    }

@router.post('make-owner')
def make_owner(response:Response, current_customer: Annotated[CustomerAuth, Depends(get_current_active_customer)]):
    phone = current_customer.get('sub')
    customer = get_customer_by_phone(phone)
    if not customer.completed :
        response.status_code = status.HTTP_400_NOT_FOUND
        return {"message": "برای برای تبدیل شدن به صاحب خانه بادی ابتدا اطلاعات کاربری را تکمیل کنید"}
    customer.isowner = True
    session.commit()
    return {
        "message": "شما هم اکنون می توانبد ویلای خودتان را ثبت کنید"
    }


@router.post('/create-address')
def make_owner(addressbase: CreateAddressBase,response:Response, current_customer: Annotated[CustomerAuth, Depends(get_current_active_customer)]):

    if (not is_Text(addressbase.shahr) or not is_Text(addressbase.ostan) or
        not is_Text(addressbase.pelak) or not is_Text(addressbase.street) or
        not is_Text(addressbase.addresskamel) or not is_Text(addressbase.postcode)):

        response.status_code = status.HTTP_400_BAD_REQUEST
        return {"message": "ورودی های نا معتبر"}

    owner = get_customer_by_phone(current_customer.get('sub'))
    address = Address(
        oid=owner.cid,
        ostan=addressbase.ostan,
        shahr=addressbase.shahr,
        street=addressbase.street,
        pelak=addressbase.pelak,
        addresskamel=addressbase.addresskamel,
        postcode=addressbase.postcode,
        location=addressbase.location
    )
    session.add(address)
    session.commit()
    return {
        "message": "آدرس جدید با موفقیت افزوده شد"
    }

@router.post('get-my-addresses')
def get_addresses(response:Response, current_customer: Annotated[CustomerAuth, Depends(get_current_active_customer)]):
    phone = current_customer.get('sub')
    customer = get_customer_by_phone(phone)
    adresses = customer.addresses
    if adresses is None:
        response.status_code = status.HTTP_404_NOT_FOUND
        return {"message": "شما آدرسی ثبت نکرده اید"}
    return adresses


@router.post('/insert-image')
def get_image(response:Response, current_customer: Annotated[CustomerAuth, Depends(get_current_active_customer)],
              pid: int, file: UploadFile = File(...)):
    #
    phone = current_customer.get('sub')
    customer = get_customer_by_phone(phone)
    product = session.query(Product).filter(Product.pid == pid).first()
    if product is None:
        response.status_code = status.HTTP_404_NOT_FOUND
        return {"message": "ویلای مورد نظر یافت نشد"}
    if product.oid != customer.cid:
        response.status_code = status.HTTP_400_BAD_REQUEST
        return {"message": "شما مجوز لازم برای آپلود عکس برای این ویلا ندارید"}
    if product.tedadaks == 10:
        response.status_code = status.HTTP_400_BAD_REQUEST
        return {"message": "حد اکثر تعداد تصویر 10 عدد می باشد"}
    try:
        os.mkdir(f'images/{pid}')
    except:
        pass


    path = f'images/{pid}/{product.tedadaks}.jpg'
    product.tedadaks +=1
    session.commit()
    with open(path, 'w+b') as buffer:
        shutil.copyfileobj(file.file, buffer)
    return {
        "message": "تصویر با مووفقیت آپلود شد"
    }


@router.post('/un-rent')
def un_rent(response:Response, current_customer: Annotated[CustomerAuth, Depends(get_current_active_customer)],
              pid: int):

    phone = current_customer.get('sub')
    customer = get_customer_by_phone(phone)
    product = session.query(Product).filter(Product.pid == pid).first()
    if product is None:
        response.status_code = status.HTTP_404_NOT_FOUND
        return {"message": "ویلای مورد نظر یافت نشد"}

    if product.oid != customer.cid:
        response.status_code = status.HTTP_400_BAD_REQUEST
        return {"message": "شما مجوز لازم برای آپلود عکس برای این ویلا ندارید"}

    product.isrent = False
    session.commit()

    return {
        "message": "ویلای مورد نظر از حالت اجاره خارج شد"
    }



@router.post('/get-my-passengers')
def get_my_passengers(response:Response, current_customer: Annotated[CustomerAuth, Depends(get_current_active_customer)]):

    phone = current_customer.get('sub')
    customer = get_customer_by_phone(phone)
    if not customer.isowner:
        response.status_code = status.HTTP_400_BAD_REQUEST
        return {
            "message": "کاربر عادی به این متد دسترسی ندارد"
        }

    products = customer.products
    if not products:
        response.status_code = status.HTTP_404_NOT_FOUND
        return {
            "message": "ویلایی تحت مالکیت شما یافت نشد"
        }
    rents = []
    for product in products:
        for rent in product.rents:
            rents.append(rent)
    if not rents:
        return {
            "message": "هیچ ویلایی از ویلا های شما اجاره داده نشده اند "
        }
    passengers = []
    for r in rents:
        passenger = session.query(Customer).filter(Customer.cid == r.cid).first()
        villa = session.query(Product).filter(Product.pid == r.pid).first()
        passeng = {
            "id": passenger.cid,
            "firstname": passenger.firstname,
            "lastname": passenger.lastname,
            "phone number": passenger.phonenumber,
            "villa": villa.title,
            "start-date": r.startdate,
            "end-date": r.endtdate
        }
        passengers.append(passeng)

    return {
        "message": "عملیات با موفقیت انجام شد",
        "passengers": passengers
    }

@router.post('/delete-images')
def delete_images(pid:int ,response:Response, current_customer: Annotated[CustomerAuth, Depends(get_current_active_customer)]):

    phone = current_customer.get('sub')
    customer = get_customer_by_phone(phone)
    if not customer.isowner:
        response.status_code = status.HTTP_400_BAD_REQUEST
        return {
            "message": "کاربر عادی به این متد دسترسی ندارد"
        }

    product = session.query(Product).filter(Product.pid == pid).first()
    if product is None:
        response.status_code = status.HTTP_404_NOT_FOUND
        return {
            "message": "ویلایی یافت نشد"
        }
    if product.oid != customer.cid:
        return {
            "message": "این ویلا متعلق به شما نیست"
        }

    product.tedadaks = 0
    session.commit()

    return {
        "message": "عملیات با موفقیت انجام شد",
    }