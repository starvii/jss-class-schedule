from tornado.web import RequestHandler
from util.log import default_logger as log
import db
from module.teacher.models import Teacher
from sqlalchemy import or_
from util.model import to_json

class EditHandler(RequestHandler):
    def get(self, teacher_id = None):
        log.debug(self.request.arguments)

    def post(self, teacher_id = None):
        log.debug(teacher_id)

class RemoveHandler(RequestHandler):
    def get(self, teacher_id = None):
        log.debug(teacher_id)

class LoadHandler(RequestHandler):
    def post(self):
        keyword = self.get_argument('keyword', '')
        page = self.get_argument('page', '1')
        size = self.get_argument('size', '10')
        try:
            p = int(page)
        except:
            p = 1
        try:
            limit = int(size)
        except:
            limit = 10
        offset = (p - 1) * limit
        # 按照编号、姓名、单位、科室查询
        session = db.session()
        kw = keyword + '%'
        c = session.query(Teacher).filter(Teacher.available == 1) \
            .filter(or_(Teacher.code.like(kw), Teacher.name.like(kw), \
            Teacher.unit.like(kw), Teacher.dept.like(kw))).count()

        l = session.query(Teacher).filter(Teacher.available == 1) \
            .filter(or_(Teacher.code.like(kw), Teacher.name.like(kw), \
            Teacher.unit.like(kw), Teacher.dept.like(kw))) \
            .offset(offset).limit(limit).all()
        session.close()
        json = '{{"count" : {}, "list" : {} }}'.format(c, to_json(l, 'kv'))
        self.write(json)