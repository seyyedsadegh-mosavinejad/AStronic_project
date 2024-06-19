from fastapi import APIRouter,status,Response,Query
from fastapi.responses import StreamingResponse
from fastapi import FastAPI, HTTPException, Depends
from fastapi.responses import StreamingResponse
from pymongo import MongoClient
import gridfs
from typing import Optional
from auth.oauth2 import get_current_active_user, get_user_by_phone
from bson.objectid import ObjectId
from io import BytesIO
from db.db_config import session
from schemas import AddProductBase, AddToCart, UserAuth
from db.models import Product, SubProduct, Cart
from typing import Annotated
from db.db_config import mgdb
from sqlalchemy import or_, and_
from fastapi import FastAPI, File, UploadFile, HTTPException
from fastapi.responses import JSONResponse
import gridfs
import re

router = APIRouter(prefix='/cart' , tags=['cart'])
fs = gridfs.GridFS(mgdb)






@router.post("/add")
async def add_product(atc: AddToCart,response:Response,
                      current_user: Annotated[UserAuth, Depends(get_current_active_user)]):
    user = get_user_by_phone(current_user.get('sub'))
    uid = user.uid

    product = session.query(SubProduct).filter(SubProduct.spid == atc.spid).first()
    if not product:
        return {
            "error": "چنین محصولی یافت نشد"
        }
    cart = session.query(Cart).filter(and_(Cart.uid == uid, Cart.spid == atc.spid)).first()


    if not cart:
        if product.mojoodi < atc.tedad:
            return {
                "message": "موجودی محصول کمتر از تعداد وارد شده است"
            }
        cart = Cart(
            uid=uid,
            spid=atc.spid,
            tedad=atc.tedad
        )
        session.add(cart)
        session.commit()
        return {
            "message": "محصول مورد نظر به سبد خرید اضافه شد"
        }
    if product.mojoodi < atc.tedad + cart.tedad:
        response.status_code = status.HTTP_400_BAD_REQUEST
        return {
            "message": "موجودی محصول کمتر از تعداد وارد شده است"
        }
    cart.tedad += atc.tedad
    session.commit()

    return {
        "message": "محصول مورد نظر به سبد خرید اضافه شد"
    }


@router.get("/remove")
async def remove_product(spid: int,response:Response,
                      current_user: Annotated[UserAuth, Depends(get_current_active_user)]):
    user = get_user_by_phone(current_user.get('sub'))
    uid = user.uid

    product = session.query(SubProduct).filter(SubProduct.spid == spid).first()
    if not product:
        return {
            "error": "چنین محصولی یافت نشد"
        }
    cart = session.query(Cart).filter(and_(Cart.uid == uid, Cart.spid == spid)).first()
    if not cart:

        return {
            "message": "این محصول از قبل وجود نداشته است"
        }

    session.delete(cart)
    session.commit()

    return {
        "message": "محصول مورد نظر از سبد خرید حذف شد"
    }



@router.get("/removeall")
async def remove_all(response:Response,
                      current_user: Annotated[UserAuth, Depends(get_current_active_user)]):
    user = get_user_by_phone(current_user.get('sub'))
    uid = user.uid


    carts = session.query(Cart).filter(Cart.uid == uid).all()
    if not carts or len(carts) == 0:

        return {
            "message": "سبد خرید شما خالی است"
        }
    for cart in carts:
        session.delete(cart)
        session.commit()

    return {
        "message": "سبد خرید شما خالی شد"
    }


@router.get("/get")
async def get_product(response:Response,
                      current_user: Annotated[UserAuth, Depends(get_current_active_user)]):
    user = get_user_by_phone(current_user.get('sub'))
    uid = user.uid

    carts = session.query(Cart).filter(Cart.uid == uid).all()
    if not carts or len(carts) == 0:

        return {
            "message": "سبد خرید شما خالی است"
        }
    mycart = []
    for cart in carts:
        d = {}
        d["spid"] = cart.spid
        d["tedad"] = cart.tedad
        mycart.append(d)

    return mycart

@router.get("/get2")
async def get2_product(response:Response,
                      current_user: Annotated[UserAuth, Depends(get_current_active_user)]):
    user = get_user_by_phone(current_user.get('sub'))
    uid = user.uid

    carts = session.query(Cart).filter(Cart.uid == uid).all()
    # return carts# return carts
    if not carts or len(carts) == 0:

        return {
            "message": "سبد خرید شما خالی است"
        }
    mycart = []
    for cart in carts:
        d = {}
        d["spid"] = cart.spid
        d["tedad"] = cart.tedad
        d["title"] = cart.subProduct.product.title
        d["price"] = cart.subProduct.price
        d["guarantee"] = cart.subProduct.product.guarantee
        d["color"] = cart.subProduct.color
        d["colorName"] = cart.subProduct.color_name
        mycart.append(d)

    return mycart


@router.get("/getnumber")
async def get_number(response:Response,
                      current_user: Annotated[UserAuth, Depends(get_current_active_user)]):

    user = get_user_by_phone(current_user.get('sub'))
    uid = user.uid

    carts = session.query(Cart).filter(Cart.uid == uid).all()
    if not carts or len(carts) == 0:

        return 0
    c = 0
    for cart in carts:
        c += cart.tedad

    return c


@router.get("/settedad")
async def set_product(spid: int, tedad: int, response:Response,
                      current_user: Annotated[UserAuth, Depends(get_current_active_user)]):
    user = get_user_by_phone(current_user.get('sub'))
    uid = user.uid

    product = session.query(SubProduct).filter(SubProduct.spid == spid).first()
    if not product:
        return {
            "error": "چنین محصولی یافت نشد"
        }

    cart = session.query(Cart).filter(and_(Cart.uid == uid, Cart.spid == spid)).first()
    if tedad > product.mojoodi:
        return {
            "message": "موجودی محصول کمتر از تعداد وارد شده است"
        }
    if not cart :
        cart = Cart(
            uid=uid,
            spid=spid,
            tedad=tedad
        )
        session.add(cart)
        session.commit()
        return {
            "message": "محصول مورد نظر به سبد خرید اضافه شد"
        }
    cart.tedad = tedad
    session.commit()

    return {
            "message": "محصول مورد نظر به سبد خرید اضافه شد"
        }







