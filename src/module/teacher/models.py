from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, SmallInteger, String, BigInteger, Binary, \
    Text, TIMESTAMP
from sqlalchemy import Sequence
Base = declarative_base()

class Teacher(Base):
    __tablename__ = 'teachers'
    dbid = Column('dbid', BigInteger, Sequence('teacher_id_seq'), primary_key=True)
    logicid = Column('logicid', Binary(16), doc = ('kv'))
    type = Column('teacher_type', SmallInteger, doc = ('kv'))
    code = Column('code', String(100), doc = ('kv'))
    name = Column('name', String(100), doc = ('kv'))
    unit = Column('unit', String(255), doc = ('kv'))
    dept = Column('dept', String(255), doc = ('kv'))
    cmt = Column('cmt', Text, doc = ('kv'))
    available = Column('available', SmallInteger)
    createtime = Column('createtime', TIMESTAMP)
    updatetime = Column('updatetime', TIMESTAMP)