from db.db_config import session
from db.models import Customer
from fastapi.exceptions import HTTPException
from fastapi import status

def get_customer_by_phone(phone):
    customer = session.query(Customer).filter(Customer.phonenumber==phone).first()
    if not customer:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail="کاربر مورد نظر یافت نشد")

    return customer