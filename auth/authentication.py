from fastapi import APIRouter, Depends, status
from fastapi.exceptions import HTTPException
from fastapi.security.oauth2 import OAuth2PasswordRequestForm
from db import models
from db.db_config import session
from db.hash import Hash
from auth import oauth2

router = APIRouter(tags=['auth'])


@router.post('/token')
def get_token(request: OAuth2PasswordRequestForm = Depends()):
    user = session.query(models.User).filter(models.User.phonenumber == request.username).first()
    if not user:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail='invalid credential')

    if not Hash.verify(user.password, request.password):
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail='invalid password')

    access_token = oauth2.create_access_token(data={'sub': request.username})

    return {
        'access_token': access_token,
        'type_token': 'bearer',
        'userID': user.uid,
        'phonenumber': user.phonenumber

    }
