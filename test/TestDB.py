import db
from module.teacher.model import Teacher


session = db.session()
l = session.query(Teacher).all()
print(l)