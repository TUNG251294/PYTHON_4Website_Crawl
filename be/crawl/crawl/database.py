from sqlalchemy import create_engine, Column, String, Integer
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
import config

SQLALCHEMY_DATABASE_URL = f"{config.DRIVER_BD}://{config.USER_NAME}:{config.PASSWORD}@{config.HOST}:{config.PORT}/{config.DB_NAME}"
engine = create_engine(SQLALCHEMY_DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()

class HasakiLink(Base):
    __tablename__ = "hasaki_link"

    id = Column(Integer, primary_key=True)
    link = Column(String)

def get_links_from_database():
    session = SessionLocal()
    links = session.query(HasakiLink.link).all()
    session.close()
    return [link[0] for link in links]
class PharmacityLink(Base):
    __tablename__ = "pharmacity_link"

    id = Column(Integer, primary_key=True, autoincrement=True)
    link = Column(String)

def get_links_from_pharmacity():
    session = SessionLocal()
    links = session.query(PharmacityLink.link).all()
    session.close()
    return [link[0] for link in links]
class GuardianLink(Base):
    __tablename__ = "guardian_link"

    id = Column(Integer, primary_key=True, autoincrement=True)
    link = Column(String)

def get_links_from_guardian():
    session = SessionLocal()
    links = session.query(GuardianLink.link).all()
    session.close()
    return [link[0] for link in links]
class WatsonLink(Base):
    __tablename__ = "watson_link"

    id = Column(Integer, primary_key=True, autoincrement=True)
    link = Column(String)
    id_watson = Column(Integer)

def get_links_from_watson():
    session = SessionLocal()
    idWatsons = session.query(WatsonLink.id_watson).all()
    session.close()
    return [link[0] for link in idWatsons]
