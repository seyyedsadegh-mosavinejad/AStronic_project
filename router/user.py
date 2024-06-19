import random

from fastapi import Depends, APIRouter, status, Response

from db.db_user import get_user_by_phone
from db.models import User, Address
from db.db_config import session
from sqlalchemy.sql.expression import and_
from auth import oauth2
from schemas import UserSignUpBase, UserAuth, UserLoginBase, CustomerCompeleteSignUpBase, RentVilllaBase
from schemas import VerifyphoneBase, AddressBase
from functions.validation import *
from typing import Annotated
from auth.oauth2 import get_current_active_user
from db.hash import Hash
# from db.db_customer import get_customer_by_phone
from datetime import date
from db.db_config import rds


router = APIRouter(prefix='/user', tags=['user'])

@router.get("/isvaliduser")
async def is_valid_user(response:Response,
                      current_user: Annotated[UserAuth, Depends(get_current_active_user)]):
    user = session.query(User).filter(User.uid == current_user.get('sub').uid)
    if not user:
        return False
    return True

@router.post('/signup')
def customer_sign_up(userbase: UserSignUpBase,response: Response):
    # if customerbase.username != "":
    #     cusromer = session.query(Customer).filter(Customer.username==customerbase.username).first()
    #     if cusromer is not None:
    #         response.status_code = status.HTTP_409_CONFLICT
    #         return {
    #             "message":"این نام کاربری قبلا استفاده شده است"
    #         }

    user = session.query(User).filter(User.phonenumber==userbase.phonenumber).first()
    if user is not None:
        response.status_code = status.HTTP_409_CONFLICT
        return {
            "message": "این شماره قبلا استفاده شده است. وارد شوید"
        }
    # if not is_valid_input(customerbase.username):
    #     response.status_code = status.HTTP_400_BAD_REQUEST
    #     return {
    #         "message": "نام کاربری تنها می تواند شامل حروف انگلیسی بزرگ و کوچک اعداد . @ و _ باشد"
    #     }
    if not is_valid_phone(userbase.phonenumber):
        response.status_code = status.HTTP_400_BAD_REQUEST
        return {
            "message": "شماره همراه نا معتبر است"
        }





    # access_token = oauth2.create_access_token(data={'sub': user.phonenumber})
    rnd = random.randint(1000, 9999)
    rds.setex(userbase.phonenumber, 180, rnd)
    print(rnd)

    return {
        # 'access_token': access_token,
        # 'type_token': 'bearer',
        # 'userID': user.uid,
        # 'phonenumber': user.phonenumber,
        "ok": True,
        "verify_code": rnd,
        "message": "مرحله اول انجام شد. کد تایید را وارد کنید"
        # 'customer': customer
    }


@router.post('/verify')
def customer_sign_up(verifybase: VerifyphoneBase, response: Response):

    code = rds.get(verifybase.phonenumber)
    # print(int(code))
    # print(type(verifybase.phonenumber))
    if code is None:
        response.status_code == status.HTTP_404_NOT_FOUND
        return {
            "message": "شماره یافت نشد. مجددا در خواست کد دهید."
        }
    if int(code) != int(verifybase.code):
        response.status_code == status.HTTP_404_NOT_FOUND
        rds.delete(verifybase.phonenumber)
        return {
            "message": "کد نا معتبر"
        }

    valid_pass = is_valid_password(verifybase.password)

    if not valid_pass['valid']:
        response.status_code = status.HTTP_400_BAD_REQUEST
        return {
            "message": valid_pass['message']
        }

    user = User(
        # username=customerbase.username,
        phonenumber=verifybase.phonenumber,
        password=Hash.bcrypt(verifybase.password)
        # email=None,
        # firstname="",
        # lastname="",
        # nationalcode="",
        # cardnumber="",
        # isowner=False


    )
    session.add(user)
    session.commit()
    session.refresh(user)

    user = session.query(User).filter(User.phonenumber == verifybase.phonenumber).first()

    access_token = oauth2.create_access_token(data={'sub': user.phonenumber})
    return {
        'access_token': access_token,
        'type_token': 'bearer',
        'userID': user.uid,
        'phonenumber': user.phonenumber,
        "ok": True,
        "message": "کد وارد شده تایید شد. خوش آمدید"
        # 'customer': customer
    }



@router.post('/login')
def customer_login(userbase: UserLoginBase, response: Response):


    user = session.query(User).filter(User.phonenumber==userbase.phonenumber).first()
    if user is None:
        response.status_code = status.HTTP_404_NOT_FOUND
        return {
            "message": "شماره همراه نا معتبر است"
        }
    if not Hash.verify(user.password,userbase.password):
        response.status_code = status.HTTP_404_NOT_FOUND
        return {
            "message": "رمز عبور نا معتبر است"
        }

    # access_token = oauth2.create_access_token(data={'sub': user.phonenumber})
    # rnd = random.randint(1000, 9999)
    # rds.setex(userbase.phonenumber, 180, rnd)
    # print(rnd)

    access_token = oauth2.create_access_token(data={'sub': user.phonenumber})

    return {
        'access_token': access_token,
        'type_token': 'bearer',
        'userID': user.uid,
        'phonenumber': user.phonenumber,
        "ok": True,
        # "verify_code": rnd,
        "message": "این مرحله انجام شد. کد تایید را وارد کنید"

    }

@router.post('/addaddress')
def add_address(addressbase: AddressBase, response: Response,
                current_user: Annotated[UserAuth, Depends(get_current_active_user)]):
    user = get_user_by_phone(current_user.get('sub'))
    uid = user.uid

    address = Address(
        ostan=addressbase.ostan,
        shahr=addressbase.shahr,
        pelak=addressbase.pelak,
        address=addressbase.address,
        phone=addressbase.phone,
        postalcode=addressbase.postalCode,
        location=addressbase.location,
        uid=uid
    )
    session.add(address)
    session.commit()

    return {
        "message": "آدرس جدید با موفقیت اضافه شد."
    }


# @router.post("/authtest")
# def authtest(current_customer: Annotated[CustomerAuth, Depends(get_current_active_customer)]):
#     return current_customer

# @router.post("/likevillla", status_code=status.HTTP_200_OK)
# def likevillla(pid: int, response:Response,
#                current_customer: Annotated[CustomerAuth, Depends(get_current_active_customer)]):
#
#     customer = get_customer_by_phone(current_customer.get('sub'))
#     cid = customer.cid
#
#     product = session.query(Product).filter(Product.pid == pid).first()
#     if(product is None):
#         response.status_code = status.HTTP_404_NOT_FOUND
#         return {"message": "ویلای مورد نظر یافت نشد"}
#
#
#     like = session.query(Likes).filter(and_(Likes.cid==cid , Likes.pid==pid)).first()
#     if(like is not None):
#         response.status_code = status.HTTP_405_METHOD_NOT_ALLOWED
#         return {"message": "این محصول قبلا توسط شما لایک شده است"}
#
#     like = Likes(cid=cid, pid=pid)
#     session.add(like)
#     session.commit()
#     product.tedadlikes = product.tedadlikes+1
#     session.commit()
#     return {"message": "محصول مورد نظر به علاقه مندی ها افزوده شد"}



#
# @router.post('/comlete-signup')
# def customer_complete_sign_up(customerbase: CustomerCompeleteSignUpBase, response: Response,
#                               current_customer: Annotated[CustomerAuth, Depends(get_current_active_customer)]):
#
#     complete = True
#
#     email = customerbase.email
#     if email is None:
#         email = ""
#         complete = False
#     else:
#         if not is_valid_input(email):
#             response.status_code = status.HTTP_400_BAD_REQUEST
#             return {
#                 "message": "ایمیل وارد شده نا معتبر است"
#             }
#
#     firstname = customerbase.firstname
#     if firstname is None:
#         firstname = ""
#         complete = False
#     else:
#         if not is_persian(firstname):
#             response.status_code = status.HTTP_400_BAD_REQUEST
#             return {
#                 "message": "نام تنها شامل حروف فارسی می باشد"
#             }
#
#     lastname = customerbase.lastname
#     if lastname is None:
#         lastname = ""
#         complete = False
#     else:
#         if not is_persian(lastname):
#             response.status_code = status.HTTP_400_BAD_REQUEST
#             return {
#                 "message": "نام خانوادگی تنها شامل حروف فارسی می باشد"
#             }
#
#     natinalcode = customerbase.nationalcode
#     if natinalcode is None:
#         natinalcode = ""
#         complete = False
#     else:
#         if not is_number(natinalcode):
#             response.status_code = status.HTTP_400_BAD_REQUEST
#             return {
#                 "message": "کد ملی می تواند تنها شامل اعداد شود"
#             }
#
#     cardnumber = customerbase.cardnumber
#     if (cardnumber is None) or (cardnumber == ""):
#         cardnumber = ""
#         complete = False
#     else:
#         if not is_number(cardnumber):
#             response.status_code = status.HTTP_400_BAD_REQUEST
#             return {
#                 "message": "شماره کارت می تواند تنها شامل اعداد شود"
#             }
#         if len(cardnumber) < 16:
#             response.status_code = status.HTTP_400_BAD_REQUEST
#             return {
#                 "message": "شماره کارت نباید کمتر از 16 رقم باشد"
#             }
#
#     customer = session.query(Customer).filter(Customer.phonenumber == current_customer.get('sub')).first()
#
#     customer.firstname = firstname
#
#     customer.email = email
#
#     customer.lastname = lastname
#
#     customer.nationalcode = natinalcode
#
#     customer.cardnumber = cardnumber
#
#     customer.completed = complete
#
#     session.commit()
#     session.flush()
#     session.refresh(customer)
#
#     return {
#         "message": "تکمیل اطلاعات با موفقیت انجام شد",
#         "name": natinalcode
#     }
#
# @router.post('/rent-villla')
# def rent_villla(rentbase: RentVilllaBase, response: Response,
#                               current_customer: Annotated[CustomerAuth, Depends(get_current_active_customer)]):
#     customer = get_customer_by_phone(current_customer.get('sub'))
#     product = session.query(Product).filter(Product.pid == rentbase.pid).first()
#     if product is None:
#         response.status_code = status.HTTP_404_NOT_FOUND
#         return {
#             "message": "ویلای مورد نظر یافت نشد"
#         }
#
#     if product.isrent:
#         return {
#             "message": "ویلا در حال حاضر اجاره داده شده است"
#         }
#
#     startdate = date(rentbase.startyear, rentbase.startmonth, rentbase.startday)
#     endtdate = date(rentbase.endyear, rentbase.endmonth, rentbase.endday)
#
#     rent = Rent(
#         cid=customer.cid,
#         pid=product.pid,
#         startdate=startdate,
#         endtdate=endtdate
#     )
#     session.add(rent)
#     session.commit()
#
#     product.isrent = True
#     session.commit()
#     delta = endtdate - startdate
#     return {
#         "price": delta.days*product.price,
#         "message": "ویلای مورد نظر اجاره شد"
#     }
#
# @router.post('/myfavorite-villla')
# def favorites_villla(response: Response,
#                               current_customer: Annotated[CustomerAuth, Depends(get_current_active_customer)]):
#     customer = get_customer_by_phone(current_customer.get('sub'))
#
#     if customer is None:
#         response.status_code = status.HTTP_404_NOT_FOUND
#         return {
#             "message": "اطلاعات کاربری نا معتبر"
#         }
#
#     # likes = session.query(Likes).filter(Likes.cid == customer.cid).all()
#     likes = customer.likes
#     # return likes
#     if Likes is None:
#         response.status_code = status.HTTP_404_NOT_FOUND
#         return {
#             "message": "ویلایی توسط شما لایک نشده است"
#         }
#     favorites = []
#
#     for like in likes:
#         favorite = session.query(Product).filter(Product.pid == like.pid).first()
#         favorites.append(favorite)
#
#
#     return {
#         "favorites": favorites,
#         "message": "عملیات با موفقیت انجام شد"
#     }
#


