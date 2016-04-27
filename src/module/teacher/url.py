from module.teacher.controller import EditHandler
from module.teacher.controller import RemoveHandler
from module.teacher.controller import LoadHandler
url = [
        (r"/teacher/modify/(\w+)", EditHandler),
        (r"/teacher/create", EditHandler),
        (r"/teacher/remove/(\w+)", RemoveHandler),
        (r"/teacher/load/(\w+)", LoadHandler),
    ]
