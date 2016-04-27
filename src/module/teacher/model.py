from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, SmallInteger, String, BigInteger, Binary, \
    Text, TIMESTAMP
from sqlalchemy import Sequence
Base = declarative_base()

class Teacher(Base):
    __tablename__ = 'teachers'
    dbid = Column(BigInteger, Sequence('teacher_id_seq'), primary_key=True)
    logicid = Column(Binary(16))
    teacher_type = Column(SmallInteger)
    code = Column(String(100))
    name = Column(String(100))
    unit = Column(String(255))
    dept = Column(String(255))
    cmt = Column(Text)
    available = Column(SmallInteger)
    createtime = Column(TIMESTAMP)
    updatetime = Column(TIMESTAMP)