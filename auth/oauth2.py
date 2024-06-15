from fastapi.security import OAuth2PasswordBearer
from fastapi import Depends, status
from fastapi.exceptions import HTTPException
from typing import Optional, Annotated
from datetime import datetime, timedelta
from db.db_config import session
from db.db_user import get_user_by_phone
from sqlalchemy.orm import Session
from jose import jwt
from jose.exceptions import JWTError
from schemas import UserAuth


oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token")

SECRET_KEY = 'b50b06cf039958cccde65c14839f856de03b1621f4ab3e7621b9782492c4ec9a'
ALGORITHM = 'HS256'
ACCESS_TOKEN_EXPIRE_MINUTES = 30


# data = {"sub" : username}
def create_access_token(data: dict, expires_delta: Optional[timedelta] = None):
    to_encode = data.copy()
    if expires_delta:
        expire = datetime.utcnow() + expires_delta
    else:
        expire = datetime.utcnow() + timedelta(minutes=15)
    to_encode.update({"exp": expire})
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    return encoded_jwt



async def get_current_user(token: Annotated[str, Depends(oauth2_scheme)]):
    user = _dict = jwt.decode(token, SECRET_KEY, algorithms=ALGORITHM)
    if not user:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid authentication credentials",
            headers={"WWW-Authenticate": "Bearer"},
        )
    return user


async def get_current_active_user(
    current_user: Annotated[UserAuth, Depends(get_current_user)]
):

    return current_user

# def get_current_customer(token: str = Depends(oauth2_scheme)):
#     error_credential = HTTPException(status_code=status.HTTP_401_UNAUTHORIZED,
#                                      detail='invalid credentials',
#                                      headers={'WWW-authenticate': 'bearer'})
#
#     try:
#         _dict = jwt.decode(token, SECRET_KEY, algorithms=ALGORITHM)
#         username = _dict.get('sub')
#         if not username:
#             raise error_credential
#     except JWTError:
#         raise error_credential
#
#     customer = get_customer_by_phone(username)
#
#     return customer
