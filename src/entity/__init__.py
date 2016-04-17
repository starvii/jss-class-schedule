from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, SmallInteger, String, BigInteger, Binary, \
    Text, TIMESTAMP
from sqlalchemy import Sequence
Base = declarative_base()

class KeyValue(Base):
    __tablename__ = 'key_value'
    dbid = Column(BigInteger, Sequence('key_value_id_seq'), primary_key=True)
    id = Column(Binary(16))
    key_type = Column(String(100))
    key = Column(String(100))
    value = Column(String(255))
    data = Column(Text)
    cmt = Column(Text)
    available = Column(SmallInteger)
    createtime = Column(TIMESTAMP)
    updatetime = Column(TIMESTAMP)