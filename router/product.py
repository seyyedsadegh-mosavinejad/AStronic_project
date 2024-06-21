from fastapi import APIRouter,status,Response,Query, Depends
from fastapi.responses import StreamingResponse
from fastapi import FastAPI, HTTPException
from fastapi.responses import StreamingResponse
from pymongo import MongoClient
import gridfs
from typing import Optional
from bson.objectid import ObjectId
from io import BytesIO

from auth.oauth2 import get_current_active_user
from db.db_config import session
from db.db_user import get_user_by_phone
from schemas import AddProductBase, UserAuth
from db.models import Product, SubProduct, User
from typing import Annotated
from db.db_config import mgdb
from fastapi import FastAPI, File, UploadFile, HTTPException
from fastapi.responses import JSONResponse
import gridfs
import re

router = APIRouter(prefix='/product' , tags=['product'])
fs = gridfs.GridFS(mgdb)


@router.get("/deletepic/{image_id}")
async def create_file(image_id:str, current_user: Annotated[UserAuth, Depends(get_current_active_user)],
                      response:Response):
    user = get_user_by_phone(current_user.get('sub'))
    uid = user.uid
    user = session.query(User).filter(User.uid == uid).first()
    if not user.isModir:
        response.status_code = status.HTTP_400_BAD_REQUEST
        return {
            "error": "شما دسترسی کافی برای این عملیات را ندارید"
        }
    try:
        # Convert image_id to ObjectId
        image_id = ObjectId(image_id)
    except Exception as e:
        raise HTTPException(status_code=400, detail="Invalid image ID format")
    collection = mgdb["fs.files"]
    result = collection.delete_one({"_id": image_id})

    if result.deleted_count == 1:
        return {"message": f"Successfully deleted the image with id: {image_id}"}
    else:
        raise HTTPException(status_code=404, detail="Image not found")

# Annotated[bytes, File(description="A file read as bytes")]
@router.post("/addpic")
async def create_file(pid: int, current_user: Annotated[UserAuth, Depends(get_current_active_user)],
                      response:Response, file: UploadFile = File(...)):
    user = get_user_by_phone(current_user.get('sub'))
    uid = user.uid
    user = session.query(User).filter(User.uid == uid).first()
    if not user.isModir:
        response.status_code = status.HTTP_400_BAD_REQUEST
        return {
            "error": "شما دسترسی کافی برای این عملیات را ندارید"
        }




    if file.content_type.startswith('image/'):
        try:
            # Read the file content
            contents = await file.read()

            # Store the file in GridFS
            file_id = fs.put(contents, filename=file.filename, content_type=file.content_type, pid=pid)

            return JSONResponse(status_code=200, content={"file_id": str(file_id), "filename": file.filename,
                                                          "content_type": file.content_type,
                                                          "pid": pid})
        except Exception as e:
            raise HTTPException(status_code=500, detail=f"An error occurred while uploading the file: {str(e)}")
    else:
        raise HTTPException(status_code=400, detail="Uploaded file is not an image")


@router.get("/image/{image_id}")
async def get_image(image_id: str):
    try:
        # Convert string image_id to ObjectId
        file_id = ObjectId(image_id)

        # Get the image file from GridFS
        grid_out = fs.get(file_id)
        image_data = grid_out.read()

        # Prepare the image data for streaming
        return StreamingResponse(BytesIO(image_data), media_type="image/jpeg")

    except gridfs.NoFile:
        raise HTTPException(status_code=404, detail="Image not found")
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@router.get("/images/{pid}")
async def get_images(pid: int):

    collection = mgdb["fs.files"]
    query = {"pid": pid}
    documents = collection.find(query)

    images = []
    for document in documents:
        images.append(document)

    image_object_list = []

    for image in images:
        image_object_list.append(image.get("_id"))

    pattern = r"'(.*?)'"
    image_id_list = re.findall(pattern, image_object_list.__str__())
    return image_id_list



@router.post("/addproduct")
async def add_product(apb: AddProductBase,response:Response):

    product = Product(
        title=apb.title,
        model=apb.model,
        price=apb.price,
        description=apb.description,
        categoryid=apb.categoryid
    )

    session.add(product)
    session.commit()
    product = session.query(Product).filter(Product.title == apb.title).first()
    return {
        "message": "اطلاعات اولیه محصول با موفقیت اضافه شد",
        "product": product
    }








@router.get("/pid{pid}", status_code=status.HTTP_200_OK)
def get_product_by_id(pid:int,response:Response):

    product = session.query(Product).filter(Product.pid==pid).first()
    if(product is None):
        response.status_code = status.HTTP_404_NOT_FOUND
        return {"error": "محصول مورد نظر یافت نشد"}

    return product

@router.get("/page{page}", status_code=status.HTTP_200_OK)
def get_product_paging(page:int,response:Response):

    products = session.query(Product).offset((page-1)*15).limit(15).all()
    if(products is None):
        response.status_code = status.HTTP_404_NOT_FOUND
        return {"message": "محصولی در این صفحه موجود نیست"}

    return products



@router.get("/getall", status_code=status.HTTP_200_OK)
def get_all_products(limit:Optional[int] = 8):


    products = session.query(Product).limit(limit).all()


    if(products is None):
        return {"message": "محصولی موجود نمی باشد"}

    return products

@router.get("/getexpencive", status_code=status.HTTP_200_OK)
def getexpencive(limit:Optional[int] = 8):


    products = session.query(Product).order_by(Product.price.desc()).limit(limit).all()


    if(products is None):
        return {"message": ",محصولی موجود نمی باشد"}

    return products

@router.get("/getcheappest", status_code=status.HTTP_200_OK)
def getcheapproducts(limit:Optional[int] = 8):


    products = session.query(Product).order_by(Product.price).limit(limit).all()


    if(products is None):
        return {"message": "محصولی موجود نمی باشد"}

    return products

@router.get("/getcategory", status_code=status.HTTP_200_OK)
def getcheapproducts(gid: int,limit :Optional[int] = 8):


    products = session.query(Product).filter(Product.categoryid==gid).limit(limit).all()


    if(products is None or len(products)==0):
        return {"message": "محصولی موجود نمی باشد"}

    return products

@router.get("/mobiles", status_code=status.HTTP_200_OK)
async def get_mobiles(limit:int,response:Response):

    products = session.query(Product).filter(Product.categoryid == 1).limit(limit).all()
    if(products is None):
        response.status_code = status.HTTP_404_NOT_FOUND
        return {"message": "محصولی در این صفحه موجود نیست"}

    for product in products:
        p = product.__dict__.pop("information")

    return products


@router.get("/laptops", status_code=status.HTTP_200_OK)
async def get_laptops(limit:int,response:Response):

    products = session.query(Product).filter(Product.categoryid == 3).limit(limit).all()
    if(products is None or len(products)==0):
        response.status_code = status.HTTP_404_NOT_FOUND
        return {"message": "محصولی در این صفحه موجود نیست"}
    for product in products:
        p = product.__dict__.pop("information")

    return products

@router.get("/consoles", status_code=status.HTTP_200_OK)
async def get_consoles(limit:int,response:Response):

    products = session.query(Product).filter(Product.categoryid == 5).limit(limit).all()
    if(products is None):
        response.status_code = status.HTTP_404_NOT_FOUND
        return {"message": "محصولی در این صفحه موجود نیست"}
    for product in products:
        p = product.__dict__.pop("information")

    return products

@router.get("/shop", status_code=status.HTTP_200_OK)
def get_consoles(scid:int,order:int,response:Response):


    if (order == 0):
        products = session.query(Product).filter(Product.scid == scid).all()
    elif (order == 1):
        products = session.query(Product).filter(Product.scid == scid).order_by(Product.price.desc()).all()
    elif (order == -1):
        products = session.query(Product).filter(Product.scid == scid).order_by(Product.price).all()
    else:
        return "order error"
    if(products is None or len(products) == 0):
        response.status_code = status.HTTP_404_NOT_FOUND
        return {"message": "محصولی در این دسته بندی موجود نیست"}

    return products


@router.get("/subproduct", status_code=status.HTTP_200_OK)
def get_subproduct(pid:int,response:Response):

    subproducts = session.query(SubProduct).filter(SubProduct.pid == pid).all()
    if(subproducts is None or len(subproducts) == 0):
        response.status_code = status.HTTP_404_NOT_FOUND
        return {"message": "محصولی موجود نیست"}

    return subproducts

@router.get("/{product_name}", status_code=status.HTTP_200_OK)
def get_product_by_name(product_name:str,response:Response):

    product = session.query(Product).filter(Product.title == product_name).first()
    if(product is None):
        response.status_code = status.HTTP_404_NOT_FOUND
        return {"message": "چنین محصولی یافت نشد"}
    d = {}
    d["pid"] = product.pid
    d["title"] = product.title
    d["model"] = product.model
    d["guarantee"] = product.guarantee
    d["sub"] = []


    for subproduct in product.subProducts:
        t = {}
        t["price"] = subproduct.price
        t["color"] = subproduct.color
        t["color_name"] = subproduct.color_name
        t["spid"] = subproduct.spid
        d["sub"].append(t)
    d["description"] = product.description
    d["information"] = product.information




    return d



