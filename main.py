from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
from db.db_config import engine
from db.models import base
# from router import customer, product, owner, admin
from router import user
from router import product , cart, subproduct
from auth import authentication
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import HTMLResponse, FileResponse

origins = [
    '*'
]

base.metadata.create_all(engine)

app = FastAPI()
# app.include_router(customer.router)
# app.include_router(product.router)
# app.include_router(owner.router)
app.include_router(authentication.router)
app.include_router(user.router)
app.include_router(product.router)
app.include_router(cart.router)
app.include_router(subproduct.router)
# app.include_router(admin.router)
# app.mount("/images", StaticFiles(directory="images"), name="images")
# app.mount("/", StaticFiles(directory="template"), name="template")

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)



@app.get('/')
def home_page():
    return "home page"

# @app.get('/', response_class=FileResponse)
# def home_page():
#     return "template/index.html"




