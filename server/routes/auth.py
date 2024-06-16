


# ctrl + .
# signup
import uuid
import bcrypt
from fastapi import Depends, HTTPException

from database import get_db
from models.user import User
from pydantic_schemas.user_create import UserCreate
from fastapi import APIRouter
from sqlalchemy.orm import Session

router = APIRouter()

@router.post('/signup')
def signup_usr(user: UserCreate, db: Session = Depends(get_db)):
   # check if user is already signed up
    user_db = db.query(User).filter(User.email == user.email).first()
    if user_db:
        raise HTTPException(400, 'user already exists')
   
    id = uuid.uuid4()
    hashed_pw = bcrypt.hashpw(user.password.encode(), bcrypt.gensalt(16))


    user_db = User(
        id=str(id),
        name=user.name,
        email=user.email,
        password= hashed_pw
    )
    db.add(user_db)
    db.commit()
    db.refresh(user_db)
    return user_db