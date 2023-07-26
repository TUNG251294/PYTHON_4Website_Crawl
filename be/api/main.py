import subprocess
from croniter import croniter
from datetime import datetime
from crontab import CronTab
from database import SessionLocal, engine
from fastapi import Depends, FastAPI, HTTPException
from schemas import SLinkList
from security import verify_password, generate_token, validate_token, check_token_expired
from sqlalchemy.orm import Session
from starlette.middleware.cors import CORSMiddleware

import re
import jwt
import crud
import models
import schemas


models.Base.metadata.create_all(bind=engine)

app = FastAPI()
origins = [
    "http://localhost",
    "http://localhost:8080",
    "http://localhost:3000",
    "https://reactjs-megasop.vercel.app",
    "https://react.thanhdev.info"
]

SECURITY_ALGORITHM = 'HS256'
SECRET_KEY = '123456'

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


@app.post("/cron-job", dependencies=[Depends(validate_token)])
def cron_tab_control(request: schemas.CronRequest):
    shop_cron = CronTab(user="root")
    path = "/www/wwwroot/megasop-crawl-data/megasop-crawl-data/crawl/crawl/run.py"

    shop_cron.remove_all()
    job = shop_cron.new(command=f"python3 {path}", comment='megasop')

    if request.status:
        if request.hour:
            job.setall(f"0 */{request.hour} * * *")
        if request.minute:
            job.setall(f"*/{request.minute} * * * *")
        shop_cron.write()
        return "success"
    else:
        job.enable(request.status)
        subprocess.call(['/usr/bin/crontab', '-r'])
        return "deleted"


@app.get("/job-exist", dependencies=[Depends(validate_token)])
def get_job_exist():
    comment = "megasop"
    shop_cron = CronTab(user="root")
    for job in shop_cron:
        if job.comment == comment:
            
            base =datetime.now()
            job_str = str(job)
            comment_index = job_str.find(" py")
            cron_only = job_str[:comment_index].strip()

            time = croniter(cron_only,base)
            time_next = time.get_next(datetime)

            sch = str(job)
            number_regex = r'\*/(\d+)'
            number_match = re.search(number_regex, sch)
            if number_match:
                number = int(number_match.group(1))
            else:
                number = None
            return {
                'job': base,
                'time_next':time_next,
                'status': 'on',
                'schedule': number
            }
    return {
        'status': 'off'
    }


@app.get("/guardian", dependencies=[Depends(validate_token)])
def get_all_guardian(
        skip: int,
        limit: int,
        name: str,
        db: Session = Depends(get_db)
):
    return crud.get_all_guardian(db=db, skip=skip, limit=limit, name=name)


@app.get("/guardian/{keyWord}", dependencies=[Depends(validate_token)])
async def search_guardian(keyWord: str):
    return await crud.crawl_guardian(keyWord)


@app.post("/guardian", dependencies=[Depends(validate_token)])
def save_guardian_links(link_list: SLinkList, db: Session = Depends(get_db)):
    return crud.save_guardian_links(link_list=link_list, db=db)


# ___________________________________________________________

@app.get("/hasaki", dependencies=[Depends(validate_token)])
def get_all_hasaki(
        skip: int,
        limit: int,
        name: str,
        db: Session = Depends(get_db)
):
    return crud.get_all_hasaki(db=db, skip=skip, limit=limit, name=name)


@app.get("/hasaki/{keyWord}", dependencies=[Depends(validate_token)])
async def search_hasaki(keyWord: str):
    return await crud.crawl_hasaki(keyWord)


@app.post("/hasaki", dependencies=[Depends(validate_token)])
def save_hasaki_links(link_list: SLinkList, db: Session = Depends(get_db)):
    return crud.save_hasaki_links(link_list=link_list, db=db)


# ___________________________________________________________

@app.get("/watsons", dependencies=[Depends(validate_token)])
def get_all_watsons(
        skip: int,
        limit: int,
        name: str,
        db: Session = Depends(get_db)
):
    return crud.get_all_watsons(db=db, skip=skip, limit=limit, name=name)


@app.get("/watsons/{keyWord}", dependencies=[Depends(validate_token)])
def search_watsons(keyWord: str):
    return crud.crawl_watsons(keyWord)


@app.post("/watsons", dependencies=[Depends(validate_token)])
def save_watsons_links(link_list: schemas.SLinkListWatson, db: Session = Depends(get_db)):
    return crud.save_watsons_links(link_list=link_list, db=db)


@app.get("/pharmacity", dependencies=[Depends(validate_token)])
def get_all_pharmacity(
        skip: int,
        limit: int,
        name: str,
        db: Session = Depends(get_db)
):
    return crud.get_all_pharmacitys(db=db, skip=skip, limit=limit, name=name)


@app.post("/linkPharmacity/", dependencies=[Depends(validate_token)])
async def create_link_pharmacity(s_links: schemas.SLinkList, db: Session = Depends(get_db)):
    return crud.create_link_pharmacity(s_links=s_links, db=db)


@app.get("/pharmacity/{keyWord}", dependencies=[Depends(validate_token)])
def search_pharmacity(keyWord: str):
    return crud.search_pharmacity(keyWord)


@app.post('/login')
def login(request_data: schemas.LoginRequest, db: Session = Depends(get_db)):
    print(f'[x] request_data: {request_data.__dict__}')
    if verify_password(username=request_data.username, password=request_data.password, db=db):
        token = generate_token(request_data.username)
        payload = jwt.decode(token, SECRET_KEY, algorithms=[SECURITY_ALGORITHM])
        expiration_time = datetime.fromtimestamp(payload["exp"])
        return {
            'token': token,
            'expiration_time': expiration_time
        }
    else:
        raise HTTPException(status_code=404, detail="User not found")

@app.post('/expired/')
def check_token_expire(CheckToken: schemas.CheckToken):
    return check_token_expired(CheckToken.token)
