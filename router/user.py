import datetime
import random

from fastapi import Depends, APIRouter, status, Response

from db.db_user import get_user_by_phone
from db.models import User, Address, Ticket
from db.db_config import session
from sqlalchemy.sql.expression import and_
from auth import oauth2
from schemas import UserSignUpBase, UserAuth, UserLoginBase, CustomerCompeleteSignUpBase, RentVilllaBase
from schemas import VerifyphoneBase, AddressBase, AddTicketBase, UserInfoBase
from functions.validation import *
from typing import Annotated
from auth.oauth2 import get_current_active_user
from db.hash import Hash
from db.db_config import rds


router = APIRouter(prefix='/user', tags=['user'])

@router.get("/isvaliduser")
async def is_valid_user(response:Response,
                      current_user: Annotated[UserAuth, Depends(get_current_active_user)]):
    try:
        user = session.query(User).filter(User.uid == current_user.get('sub'))
        if not user:
            return False
        return True
    except:
        return False

@router.post('/signup')
async def customer_sign_up(userbase: UserSignUpBase,response: Response):
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
async def customer_sign_up(verifybase: VerifyphoneBase, response: Response):

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
        password=Hash.bcrypt(verifybase.password),
        email="",
        firstname="",
        lastname="",
        nationalcode="",
        cardnumber="",
        birthdate=""
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
async def customer_login(userbase: UserLoginBase, response: Response):


    user = session.query(User).filter(User.phonenumber==userbase.phonenumber).first()

    if user is None:
        response.status_code = status.HTTP_200_OK
        return {
            "error": "شماره همراه نا معتبر است"
        }
    if not Hash.verify(user.password,userbase.password):
        response.status_code = status.HTTP_200_OK
        return {
            "error": "رمز عبور نا معتبر است"
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
async def add_address(addressbase: AddressBase, response: Response,
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

@router.get('/addresses')
async def my_addresses( response: Response,
                current_user: Annotated[UserAuth, Depends(get_current_active_user)]):
    user = get_user_by_phone(current_user.get('sub'))
    uid = user.uid

    addresses = session.query(Address).filter(Address.uid == uid).all()
    if not addresses or len(addresses) == 0:
        return {
            "message": "هنوز آدرسی ثبت نکرده اید"
        }
    return addresses

@router.get('/deleteaddress')
async def delete_address(addressId:int, response: Response,
                current_user: Annotated[UserAuth, Depends(get_current_active_user)]):
    user = get_user_by_phone(current_user.get('sub'))
    uid = user.uid

    address = session.query(Address).filter(Address.addressid == addressId).first()
    if not address:
        return {
            "error": "چنین آدرسی موجود نمی باشد"
        }
    if address.uid != uid:
        return {
            "error": "شما دسترسی لازم برای حذف این آدرس را ندارید"
        }

    session.delete(address)
    session.commit()
    addresses = session.query(Address).filter(Address.uid == uid).all()
    if not addresses or len(addresses) == 0:
        return {
            "message": "هنوز آدرسی ثبت نکرده اید.",
            "seccess_message": "آدرس مورد نظر با موفقیت حذف شد"
        }

    return {
        "seccess_message": "آدرس مورد نظر با موفقیت حذف شد"
    }

@router.post('/addticket')
async def add_ticket(addticketbase: AddTicketBase, response: Response,
                current_user: Annotated[UserAuth, Depends(get_current_active_user)]):
    user = get_user_by_phone(current_user.get('sub'))
    uid = user.uid

    ticket = Ticket(
        uid=uid,
        subject=addticketbase.subject,
        message=addticketbase.message,
        date=datetime.datetime.now(),
        isChecked=False
    )
    session.add(ticket)
    session.commit()

    return {
        "message": "پیغام شما ثبت شد"
    }

@router.get('/tickets')
async def my_tickets(response: Response,
                current_user: Annotated[UserAuth, Depends(get_current_active_user)]):
    user = get_user_by_phone(current_user.get('sub'))
    uid = user.uid

    tickets = session.query(Ticket).filter(Ticket.uid == uid).all()
    if not tickets or len(tickets) == 0:
        return {
            "message": "پیامی ثبت نکرده اید"
        }
    return tickets



@router.get('/info')
async def my_info( response: Response,
                current_user: Annotated[UserAuth, Depends(get_current_active_user)]):
    user = get_user_by_phone(current_user.get('sub'))
    uid = user.uid

    user = session.query(User).filter(User.uid == uid).first()
    return {
        "email": user.email,
        "first_name": user.firstname,
        "last_name": user.lastname,
        "birthdate": user.birthdate,
        "phonenumber": user.phonenumber,
        "national_code": user.nationalcode,
        "cardnumber": user.cardnumber
    }




@router.post('/setinfo')
async def set_info(infobase:UserInfoBase, response: Response,
                current_user: Annotated[UserAuth, Depends(get_current_active_user)]):
    user = get_user_by_phone(current_user.get('sub'))
    uid = user.uid

    user = session.query(User).filter(User.uid == uid).first()
    if infobase.email:
        user.email = infobase.email
    if infobase.firstname:
        user.firstname = infobase.firstname
    if infobase.lastname:
        user.lastname = infobase.lastname
    if infobase.birthdate:
        user.birthdate = infobase.birthdate
    if infobase.cardnumber:
        user.cardnumber = infobase.cardnumber
    if infobase.nationalcode:
        user.nationalcode = infobase.nationalcode
    if infobase.password:
        valid_pass = is_valid_password(infobase.password)

        if not valid_pass['valid']:

            return {
                "error": valid_pass['message']
            }
        user.password = Hash.bcrypt(infobase.password)
    session.commit()
    return {
        "message": "تغییرات با موفقیت ثبت شد"
    }





