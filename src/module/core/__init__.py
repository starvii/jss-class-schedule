import sys
from util.log import default_logger as log

# 教学日历
class TeachingCalendar:
    def __init__(self):
        self.date = None
        self.replacedDate = None
        self.replacedWeekdat = None
        self.weekNum = None # 周编号



class CoursePerWeek(object):
    def __init__(self, courseName = '', weekDay = '', dayPeriod = '', classes = '', weekRange = ''):
        self.courseName = courseName # 课程名称
        self.weekDay = weekDay # 每周上课星期
        self.dayPeriod = dayPeriod # 节次
        self.classes = classes # 班级
        self.weekRange = weekRange # 课程周数范围

#     @staticmethod
#     def obejct_from_string(string):
# #===============================================================================
# #外科护理学    TUE    AM12    9/10/助产    1-13
# #外科护理学    TUE    AM345    1/2/3/4
# #外科护理学    TUE    PM678    5/6/7/8
# #外科护理学    THU    AM12    5/6/7/8
# #外科护理学    FRI    AM12    1/2/3/4
# #===============================================================================
#         l = [s.strip() for s in string.strip().split('\t')]
#         try:
#             o = CoursePerWeek()
#             o.course_name = l[0]
#             o.week_day = l[1]
#             o.day_period = l[2]
#             o.classes = l[3]
#             try:
#                 wp = l[4].replace(' ', '').split('-')
#                 o.week_period = (int(ValueUtil.del_non_numeric(wp[0])), 
#                                 int(ValueUtil.del_non_numeric(wp[1])))
#             except Exception:
#                 o.week_period = ''
#             return o
#         except Exception:
#             info = sys.exc_info()
#             log.error(info)