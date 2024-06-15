from pydantic import BaseModel

class OwnerBase(BaseModel):
    username:str
    email:str
    password:str
    firstname:str
    lastname:str
    phonenumber:str
    nationalcode:str
    cardnumber:str

class OwnerUpdateBase(BaseModel):
    oid:int
    username:str
    email:str
    password:str
    firstname:str
    lastname:str
    phonenumber:str
    nationalcode:str
    cardnumber:str


class UserSignUpBase(BaseModel):
    phonenumber: str
class AddProductBase(BaseModel):
    title: str
    model: str
    description: str
    price: float
    categoryid: int
class AddToCart(BaseModel):
    pid: int
    tedad: int

# class AddProductPictureBase(BaseModel):
#     pid: int
#     picture:


class VerifyphoneBase(BaseModel):
    phonenumber: str
    password:str
    code: str
class CustomerCompeleteSignUpBase(BaseModel):
    email: str
    firstname: str
    lastname: str
    nationalcode: str
    cardnumber: str

class RentVilllaBase(BaseModel):
    pid: int
    startyear:int
    startmonth:int
    startday:int
    endyear:int
    endmonth:int
    endday:int

class UserLoginBase(BaseModel):
    phonenumber:str
    password:str



class UserAuth(BaseModel):
    uid : int
    phonenumber : str
    class Config:
        from_attributes = True

class CreateVilllaBase(BaseModel):
    title: str
    price: int
    addressid: int
    roomcount: int
    description: str
    tedadaks: int
    salsakht: int
    nomantaghe: str
    noeghamatgah: str
    masahatzamin: int
    masahatsakhtaman: int
    zarfiatstandard: int
    zarfiathadaksar: int
    tedadhamam: int
    emkanat: str

class CreateAddressBase(BaseModel):
    ostan: str
    shahr: str
    street: str
    pelak: str
    addresskamel: str
    postcode: str
    location: str


