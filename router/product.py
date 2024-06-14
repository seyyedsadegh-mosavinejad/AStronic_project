from fastapi import APIRouter,status,Response,Query
from fastapi.responses import StreamingResponse
from fastapi import FastAPI, HTTPException
from fastapi.responses import StreamingResponse
from pymongo import MongoClient
import gridfs
from typing import Optional
from bson.objectid import ObjectId
from io import BytesIO
from db.db_config import session
from schemas import AddProductBase
from db.models import Product
from typing import Annotated
from db.db_config import mgdb
from fastapi import FastAPI, File, UploadFile, HTTPException
from fastapi.responses import JSONResponse
import gridfs
import re

router = APIRouter(prefix='/product' , tags=['product'])
fs = gridfs.GridFS(mgdb)

# Annotated[bytes, File(description="A file read as bytes")]
@router.post("/addpic")
async def create_file(pid: int, file: UploadFile = File(...)):




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
    return {image_id_list.__str__()}



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



