import sys
import util.value_util as ValueUtil
from util.log_util import default_logger as log

class OverAllWeekScheduleObject(object):
    def __init__(self):
        self.__course_name = ''
        self.__week_day = ''
        self.__day_period = ''
        self.__classes = ''
        self.__week_period = ''

    @staticmethod
    def obejct_from_string(string):
#===============================================================================
#外科护理学	TUE	AM12	9/10/助产	1-13
#外科护理学	TUE	AM345	1/2/3/4
#外科护理学	TUE	PM678	5/6/7/8
#外科护理学	THU	AM12	5/6/7/8
#外科护理学	FRI	AM12	1/2/3/4
#===============================================================================
        l = [s.strip() for s in string.strip().split('\t')]
        try:
            o = OverAllWeekScheduleObject()
            o.course_name = l[0]
            o.week_day = l[1]
            o.day_period = l[2]
            o.classes = l[3]
            try:
                wp = l[4].replace(' ', '').split('-')
                o.week_period = (int(ValueUtil.del_non_numeric(wp[0])), 
                                int(ValueUtil.del_non_numeric(wp[1])))
            except Exception:
                o.week_period = ''
            return o
        except Exception:
            info = sys.exc_info()
            log.error(info)

    def get_course_name(self):
        return self.__course_name

    def get_week_day(self):
        return self.__week_day

    def get_day_period(self):
        return self.__day_period

    def get_classes(self):
        return self.__classes

    def get_week_period(self):
        return self.__week_period

    def set_course_name(self, value):
        self.__course_name = value

    def set_week_day(self, value):
        self.__week_day = value

    def set_day_period(self, value):
        self.__day_period = value

    def set_classes(self, value):
        self.__classes = value

    def set_week_period(self, value):
        self.__week_period = value

    course_name = property(get_course_name, set_course_name, \
                           "course_name's docstring")
    week_day = property(get_week_day, set_week_day, "week_day's docstring")
    day_period = property(get_day_period, set_day_period, \
                          "day_period's docstring")
    classes = property(get_classes, set_classes, "classes's docstring")
    week_period = property(get_week_period, set_week_period, \
                           "week_period's docstring")

def test():
    print('HelloWorld!')

if __name__ == '__main__':
    test()
