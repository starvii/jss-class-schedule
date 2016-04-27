from tornado.web import RequestHandler
from util.log import default_logger as log

class EditHandler(RequestHandler):
    def get(self, teacher_id = None):
        log.debug(self.request.arguments)

    def post(self, teacher_id = None):
        log.debug(teacher_id)

class RemoveHandler(RequestHandler):
    def get(self, teacher_id = None):
        log.debug(teacher_id)

class LoadHandler(RequestHandler):
    def get(self, teacher_id):
        self.write(teacher_id)