from typing import Optional

from pydantic import BaseModel
from datetime import datetime


class Hasaki(BaseModel):
    id: int
    name: str
    price: int
    status: str
    original_price: int
    crawl_time: datetime

    class Config:
        orm_mode = True


class WatsonLink(BaseModel):
    link: str
    id_watson: int


class CronRequest(BaseModel):
    status: bool
    hour: int
    minute: int


class CheckToken(BaseModel):
    token: Optional[str]


class Watson(BaseModel):
    id: int
    name: str
    price: int
    total: int
    original_price: int
    crawl_time: datetime

    class Config:
        orm_mode = True


class Pharmacity(BaseModel):
    id: int
    name: str
    price: int
    total: int
    original_price: int
    crawl_time: datetime

    class Config:
        orm_mode = True


class PharmacityLink(BaseModel):
    id: int
    link: str

    class Config:
        orm_mode = True


class SLinkList(BaseModel):
    s_links: list[str]


class SLinkListWatson(BaseModel):
    s_links: list[WatsonLink]


class Response(BaseModel):
    message: str
    size: int


class GuardianLink(BaseModel):
    pass


class Guardian(BaseModel):
    id: int
    name: str
    price: int
    status: str
    original_price: int
    crawl_time: datetime

    class Config:
        orm_mode = True


class PharmacityList(BaseModel):
    listPharmacity: list[Pharmacity]
    count: int


class HasakiList(BaseModel):
    listHasaki: list[Hasaki]
    count: int


class GuardianList(BaseModel):
    listGuardian: list[Guardian]
    count: int


class WatsonList(BaseModel):
    listWatson: list[Watson]
    count: int


#Login ___________________________________________________________________________
class LoginRequest(BaseModel):
    username: str
    password: str


class TokenCheck(BaseModel):
    token: str

