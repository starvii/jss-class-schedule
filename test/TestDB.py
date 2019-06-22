import db
from module.teacher.models import Teacher
from sqlalchemy import or_
from sqlalchemy import func

session = db.session()
s = '陈%'
l = session.query(Teacher).filter(Teacher.available == 1) \
    .filter(or_(Teacher.code.like(s), Teacher.name.like(s), Teacher.unit.like(s), Teacher.dept.like(s)))\
    .offset(10).limit(10).all()
c = session.query(func.count(Teacher)).filter(Teacher.available == 1) \
    .filter(or_(Teacher.code.like(s), Teacher.name.like(s), Teacher.unit.like(s), Teacher.dept.like(s))).as_scalar()
print(l)
print(c)

x = l[0]

from util.model import to_json
# print(to_json(x, 'kv'))
print (to_json(l, 'kv'))


# print(dir(x))
# print(type(x))
# 
# print(type(Teacher.logicid.__doc__))
# import util.encode
# import json
# x = json.dumps(l, cls = util.encode.new_alchemy_encoder(), ensure_ascii=False, indent=2)
# print(x)