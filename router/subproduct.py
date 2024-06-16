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

router = APIRouter(prefix='/subproduct' , tags=['subproduct'])
fs = gridfs.GridFS(mgdb)






@router.get("/get")
async def add_product(spid:int ,response:Response):


    subproduct = session.query(SubProduct).filter(SubProduct.spid == spid).first()
    if not subproduct:
        return {
            "error": "چنین محصولی یافت نشد"
        }

    return subproduct




