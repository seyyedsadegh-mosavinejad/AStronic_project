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
from db.models import Product, SubProduct, Cart, Raveshersal, Address, Sefaresh, SefareshRow, User
from typing import Annotated
from db.db_config import mgdb
from sqlalchemy import or_, and_
from fastapi import FastAPI, File, UploadFile, HTTPException
from fastapi.responses import JSONResponse
import gridfs
import re

router = APIRouter(prefix='/modir' , tags=['modir'])
fs = gridfs.GridFS(mgdb)





@router.get("/allsefaresh")
async def get_all_sefaresh(response:Response, current_user: Annotated[UserAuth, Depends(get_current_active_user)]):
    user = get_user_by_phone(current_user.get('sub'))
    uid = user.uid
    user = session.query(User).filter(User.uid == uid).first()
    if not user.isModir:
        response.status_code = status.HTTP_400_BAD_REQUEST
        return {
            "error": "شما دسترسی کافی برای این عملیات را ندارید"
        }

    sefareshs = session.query(Sefaresh).all()
    return sefareshs



@router.get("/changestatus")
async def change_status_sefaresh(sid: int, newstatus: int, current_user: Annotated[UserAuth, Depends(get_current_active_user)], response:Response):
    user = get_user_by_phone(current_user.get('sub'))
    uid = user.uid
    user = session.query(User).filter(User.uid == uid).first()
    if not user.isModir:
        response.status_code = status.HTTP_400_BAD_REQUEST
        return {
            "error": "شما دسترسی کافی برای این عملیات را ندارید"
        }

    sefaresh = session.query(Sefaresh).filter(Sefaresh.sid == sid).first()

    if sefaresh is None:
        return {
            "error": "سفارشی یافت نشد"
        }

    sefaresh.statusid = newstatus
    session.commit()

    return {
        "message": f"وضعیت سفارش شما با کد {sefaresh.sid} با موفقیت تغییر کرد. "
    }

#
# @router.get("/remove")
# async def remove_product(spid: int,response:Response,
#                       current_user: Annotated[UserAuth, Depends(get_current_active_user)]):
#     user = get_user_by_phone(current_user.get('sub'))
#     uid = user.uid
#
#     product = session.query(SubProduct).filter(SubProduct.spid == spid).first()
#     if not product:
#         return {
#             "error": "چنین محصولی یافت نشد"
#         }
#     cart = session.query(Cart).filter(and_(Cart.uid == uid, Cart.spid == spid)).first()
#     if not cart:
#
#         return {
#             "message": "این محصول از قبل وجود نداشته است"
#         }
#
#     session.delete(cart)
#     session.commit()
#
#     return {
#         "message": "محصول مورد نظر از سبد خرید حذف شد"
#     }
#
#
#
# @router.get("/removeall")
# async def remove_all(response:Response,
#                       current_user: Annotated[UserAuth, Depends(get_current_active_user)]):
#     user = get_user_by_phone(current_user.get('sub'))
#     uid = user.uid
#
#
#     carts = session.query(Cart).filter(Cart.uid == uid).all()
#     if not carts or len(carts) == 0:
#
#         return {
#             "message": "سبد خرید شما خالی است"
#         }
#     for cart in carts:
#         session.delete(cart)
#         session.commit()
#
#     return {
#         "message": "سبد خرید شما خالی شد"
#     }
#
#
# @router.get("/get")
# async def get_product(response:Response,
#                       current_user: Annotated[UserAuth, Depends(get_current_active_user)]):
#     user = get_user_by_phone(current_user.get('sub'))
#     uid = user.uid
#
#     carts = session.query(Cart).filter(Cart.uid == uid).all()
#     if not carts or len(carts) == 0:
#
#         return {
#             "message": "سبد خرید شما خالی است"
#         }
#     mycart = []
#     for cart in carts:
#         d = {}
#         d["spid"] = cart.spid
#         d["tedad"] = cart.tedad
#         mycart.append(d)
#
#     return mycart
#
# @router.get("/getnumber")
# async def get_number(response:Response,
#                       current_user: Annotated[UserAuth, Depends(get_current_active_user)]):
#
#     user = get_user_by_phone(current_user.get('sub'))
#     uid = user.uid
#
#     carts = session.query(Cart).filter(Cart.uid == uid).all()
#     if not carts or len(carts) == 0:
#
#         return 0
#     c = 0
#     for cart in carts:
#         c += cart.tedad
#
#     return c
#
#
# @router.get("/settedad")
# async def set_product(spid: int, tedad: int, response:Response,
#                       current_user: Annotated[UserAuth, Depends(get_current_active_user)]):
#     user = get_user_by_phone(current_user.get('sub'))
#     uid = user.uid
#
#     product = session.query(SubProduct).filter(SubProduct.spid == spid).first()
#     if not product:
#         return {
#             "error": "چنین محصولی یافت نشد"
#         }
#
#     cart = session.query(Cart).filter(and_(Cart.uid == uid, Cart.spid == spid)).first()
#     if tedad > product.mojoodi:
#         return {
#             "message": "موجودی محصول کمتر از تعداد وارد شده است"
#         }
#     if not cart :
#         cart = Cart(
#             uid=uid,
#             spid=spid,
#             tedad=tedad
#         )
#         session.add(cart)
#         session.commit()
#         return {
#             "message": "محصول مورد نظر به سبد خرید اضافه شد"
#         }
#     cart.tedad = tedad
#     session.commit()
#
#     return {
#             "message": "محصول مورد نظر به سبد خرید اضافه شد"
#         }
#
#





