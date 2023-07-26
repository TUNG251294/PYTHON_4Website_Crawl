

from sqlalchemy import Column, Integer, String, DateTime
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()


class GuardianLink(Base):
    __tablename__ = "guardian_link"

    id = Column(Integer, primary_key=True, autoincrement=True)
    link = Column(String)
    create_time = Column(DateTime)


class Guardian(Base):
    __tablename__ = "guardian"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String)
    price = Column(Integer)
    original_price = Column(Integer)
    crawl_time = Column(DateTime)
    status = Column(String)


# ______________________________________________________________________


class HasakiLink(Base):
    __tablename__ = "hasaki_link"

    id = Column(Integer, primary_key=True, autoincrement=True)
    link = Column(String)
    create_time = Column(DateTime)


class Hasaki(Base):
    __tablename__ = 'hasaki'

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String)
    price = Column(Integer)
    original_price = Column(Integer)
    crawl_time = Column(DateTime)
    status = Column(String)


# pharmacity________________________________________________________________


class Pharmacity(Base):
    __tablename__ = "pharmacity"
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String)
    price = Column(Integer)
    total = Column(Integer)
    crawl_time = Column(DateTime)
    original_price = Column(Integer)


class PharmacityLink(Base):
    __tablename__ = "pharmacity_link"
    id = Column(Integer, primary_key=True, autoincrement=True)
    link = Column(String)
    create_time = Column(DateTime)


# watson____________________________________________________________________


class WatsonLink(Base):
    __tablename__ = "watson_link"

    id = Column(Integer, primary_key=True, autoincrement=True)
    link = Column(String)
    id_watson = Column(Integer)
    create_time = Column(DateTime)


class Watson(Base):
    __tablename__ = "watson"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String)
    price = Column(Integer)
    total = Column(Integer)
    crawl_time = Column(DateTime)
    original_price = Column(Integer)


class Account(Base):
    __tablename__ = "account"

    id = Column(Integer, primary_key=True, autoincrement=True)
    username = Column(String)
    password = Column(String)
    token = Column(String)

