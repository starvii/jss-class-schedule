from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, SmallInteger, String, BigInteger, Binary, \
    LargeBinary, Text, TIMESTAMP
from sqlalchemy import Sequence

Base = declarative_base()

class Lesson(Base):
    __tablename__ = 'lessons'
    dbid = Column(BigInteger, Sequence('lesson_id_seq'), primary_key=True)
    id = Column(Binary(16))
    pid = Column(Binary(16))
    path = Column(LargeBinary)
    num = Column(String(30))
    name = Column(String(100))
    lesson_type = Column(SmallInteger)
    lesson_time = Column(SmallInteger)
    cmt = Column(Text)
    available = Column(SmallInteger)
    createtime = Column(TIMESTAMP)
    updatetime = Column(TIMESTAMP)
    
    def __repr__(self):
        return '<User(dbid={},id={},pid={},path={},num={},name={},type={},time={},cmt={},available={},createtime={}, updatetime={})>' \
            .format(self.dbid, self.id, self.pid, self.path, self.num, \
                    self.name, self.lesson_type, self.lesson_time, self.cmt, \
                    self.available, self.createtime, self.updatetime)

class Dependency(Base):
    __tablename__ = 'lesson_dependencies'
    dbid = Column(BigInteger, Sequence('lesson_dependency_id_seq'), \
                  primary_key=True)
    id = Column(Binary(16))
    tar_id = Column(Binary(16))
    dep_id = Column(Binary(16))
    cmt = Column(Text)
    available = Column(SmallInteger)
    createtime = Column(TIMESTAMP)
    updatetime = Column(TIMESTAMP)

class Lesson_Teacher(Base):
    __tablename__ = 'lesson_teacher'
    dbid = Column(BigInteger, Sequence('lesson_teacher_id_seq'), \
                  primary_key=True)
    id = Column(Binary(16))
    lesson_id = Column(Binary(16))
    teacher_id = Column(Binary(16))
    cmt = Column(Text)
    available = Column(SmallInteger)
    createtime = Column(TIMESTAMP)
    updatetime = Column(TIMESTAMP)
