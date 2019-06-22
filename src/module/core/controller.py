from tornado.web import RequestHandler
from util.log import default_logger as log
import module.core.dateutil as DateUtil
from module.core import CoursePerWeek
from module.core.core import generate_schedule
import module.core.render
import json

class MakeTemplateHandler(RequestHandler):
    def post(self):
        try:
            body = self.request.body.decode("utf-8")
            data = json.loads(body)
            calender = data['calender']
            course = data['lesson']
            classes = data['class']
            timetable = data['timetable']
            ds = DateUtil.DateListGenerator().generate_date_list(calender)
            
            ss = []
            for tt in timetable:
                cpw = CoursePerWeek(course, tt[0], tt[1], classes)
                ss.append(cpw)
            l = generate_schedule(ds, ss)
            ret = module.core.render.csv_render(l)
            self.write(ret)
        except Exception as e:
            log.error(e);
