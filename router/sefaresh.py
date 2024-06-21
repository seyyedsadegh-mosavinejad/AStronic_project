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
            "error": "آدرس مورد نظر یافت نشد"
        }
    if address.uid != uid:
        return {
            "error": "آدرس مورد نظر یافت نشد"
        }
    raveshersal = session.query(Raveshersal).filter(Raveshersal.raveshersalid == raveshersalid).first()
    if not raveshersal:
        return {
            "error": "روش ارسال نا معتبر"
        }

    carts = session.query(Cart).filter(Cart.uid == uid).all()
    if not carts or len(carts) == 0:
        return {
            "error": "سبد خرید شما خالی است"
        }

    mablaq = 0
    for cart in carts:
        sp = session.query(SubProduct).filter(SubProduct.spid == cart.spid).first()
        mablaq += cart.tedad * sp.price

    addressStr = (address.ostan + " " +address.shahr + " " + address.address + " کد پستی :"
                  + address.postalcode + " پلاک: " + address.pelak + "تلفن: " + address.phone)

    sefaresh = Sefaresh(
        uid=uid,
        address=addressStr,
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
        "message": sefaresh.sid
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

@router.get("/sefareshrows/{sid}")
async def get_sefareshrows(sid:int, response: Response, current_user: Annotated[UserAuth, Depends(get_current_active_user)]):
    user = get_user_by_phone(current_user.get('sub'))
    uid = user.uid

    sefaresh = session.query(Sefaresh).filter(Sefaresh.sid == sid).first()
    if sefaresh is None or sefaresh.uid != uid:
        return {
            "error": "سفارش مورد نظر یافت نشد"
        }

    rows = session.query(SefareshRow).filter(SefareshRow.sid == sefaresh.sid).all()

    data = []
    collection = mgdb["fs.files"]
    for row in rows:
        d = {}

        query = {"pid": row.subProduct.pid}
        documents = collection.find(query)

        images = []
        for document in documents:
            images.append(document)

        image_object_list = []

        for image in images:
            image_object_list.append(image.get("_id"))

        pattern = r"'(.*?)'"
        image_id_list = re.findall(pattern, image_object_list.__str__())

        d["image"] = image_id_list[0]
        d["tedad"] = row.tedad
        d["price"] = row.price
        d["total_price"] = row.totalPrice
        d["title"] = row.subProduct.product.title
        d["color"] = row.subProduct.color
        d["color_name"] = row.subProduct.color_name
        data.append(d)

    return data

@router.get("/sid")
async def get_mysefareshha(sid:int, response: Response, current_user: Annotated[UserAuth, Depends(get_current_active_user)]):
    user = get_user_by_phone(current_user.get('sub'))
    uid = user.uid

    sefaresh = session.query(Sefaresh).filter(Sefaresh.sid == sid).first()
    if sefaresh is None or sefaresh.uid != uid:
        return {
            "error": "سفارش مورد نظر یافت نشد"
        }

    d = {}
    d["sid"] = sefaresh.sid
    d["name"] = sefaresh.user.firstname + " " + sefaresh.user.lastname
    d["date"] = sefaresh.date
    d["mablaq"] = sefaresh.mablaq
    d["address"] = sefaresh.address
    d["ravesh_ersal"] = sefaresh.raveshErsal.raveshersal


    return d





