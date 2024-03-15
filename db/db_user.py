from db.db_config import session
from db.models import User
from fastapi.exceptions import HTTPException
from fastapi import status

def get_user_by_phone(phone):
    user = session.query(User).filter(User.phonenumber==phone).first()
    if not user:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail="کاربر مورد نظر یافت نشد")

    return user