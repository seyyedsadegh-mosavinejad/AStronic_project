import datetime

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
from db.models import Product, SubProduct, Cart, Raveshersal, Address, Sefaresh, SefareshRow, Status
from typing import Annotated
from db.db_config import mgdb
from sqlalchemy import or_, and_
from fastapi import FastAPI, File, UploadFile, HTTPException
from fastapi.responses import JSONResponse
import gridfs
import re

router = APIRouter(prefix='/sefaresh' , tags=['sefaresh '])
fs = gridfs.GridFS(mgdb)





@router.get("/raveshersal")
async def get_raveshersal(response:Response):

    raveshha = session.query(Raveshersal).all()

    return raveshha

@router.get("/statuses")
async def get_statuses(response:Response):

    statuses = session.query(Status).all()

    return statuses

@router.get("/mysefareshha")
async def get_mysefareshha(response: Response, current_user: Annotated[UserAuth, Depends(get_current_active_user)]):
    user = get_user_by_phone(current_user.get('sub'))
    uid = user.uid

    sefareshha = session.query(Sefaresh).filter(Sefaresh.uid == uid).all()
    if not sefareshha or len(sefareshha) == 0:
        return {
            "message": "سفارشس برای شما یافت نشد"
        }

    return sefareshha

@router.get("/sabt")
async def sabt_sefaresh(addressid: int, raveshersalid: int, current_user: Annotated[UserAuth, Depends(get_current_active_user)]):
    user = get_user_by_phone(current_user.get('sub'))
    uid = user.uid

    address = session.query(Address).filter(Address.addressid == addressid).first()
    if not address:
        return {
            "message": "آدرس مورد نظر یافت نشد"
        }
    if address.uid != uid:
        return {
            "message": "آدرس مورد نظر یافت نشد"
        }
    raveshersal = session.query(Raveshersal).filter(Raveshersal.raveshersalid == raveshersalid).first()
    if not raveshersal:
        return {
            "error": "روش ارسال نا معتبر"
        }

    carts = session.query(Cart).filter(Cart.uid == uid).all()
    if not carts or len(carts) == 0:
        return {
            "message": "سبد خرید شما خالی است"
        }

    mablaq = 0
    for cart in carts:
        sp = session.query(SubProduct).filter(SubProduct.spid == cart.spid).first()
        mablaq += cart.tedad * sp.price
    sefaresh = Sefaresh(
        uid=uid,
        addressid=addressid,
        raveshErsalid=raveshersalid,
        statusid=2,
        date=datetime.date.today(),
        mablaq=mablaq,
    )
    session.add(sefaresh)
    session.commit()


    for cart in carts:
        sp = session.query(SubProduct).filter(SubProduct.spid == cart.spid).first()
        sefrow = SefareshRow(
            sid=sefaresh.sid,
            spid=cart.spid,
            tedad=cart.tedad,
            price=sp.price,
            totalPrice=sp.price*cart.tedad
        )
        session.add(sefrow)
        session.commit()

        session.delete(cart)
        session.commit()


    return {
        "message": f"سفارش شما با کد {sefaresh.sid} با موفقیت ثبت شد. ودر وضعیت منتظر پرداخت قرار دارد "
    }



@router.get("/sefnumber/")
async def get_sefnumber( response: Response, current_user: Annotated[UserAuth, Depends(get_current_active_user)]):

    user = get_user_by_phone(current_user.get('sub'))
    uid = user.uid
    number = []

    for i in range(1,6):
        sefareshha = session.query(Sefaresh).filter(and_(Sefaresh.uid == uid, Sefaresh.statusid == i)).all()
        if not sefareshha or len(sefareshha) == 0:
            number.append(0)
        else:
            number.append(len(sefareshha))

    return number



@router.get("/sefaresh/{status}")
async def get_mysefareshha(status:int, response: Response, current_user: Annotated[UserAuth, Depends(get_current_active_user)]):
    user = get_user_by_phone(current_user.get('sub'))
    uid = user.uid

    sefareshs = session.query(Sefaresh).filter(and_(Sefaresh.uid == uid, Sefaresh.statusid == status)).all()
    if not sefareshs or len(sefareshs) == 0:
        return {
            "message": "سفارشی موجود نیست"
        }
    data = []
    for sefaresh in sefareshs:
        d = {}
        d["sid"] = sefaresh.sid
        d["address"] = sefaresh.address
        d["ravesh_ersal"] = sefaresh.raveshErsal.raveshersal
        d["date"] = sefaresh.date
        d["status"] = sefaresh.status.status
        d["mablaq"] = sefaresh.mablaq
        data.append(d)

    return data





