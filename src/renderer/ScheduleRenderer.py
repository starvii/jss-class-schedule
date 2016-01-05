from enum import Enum
import util.DateUtil as DateUtil
import util.LogUtil

log = util.LogUtil.log

__DATE_FORMAT = '%m.%d'

class WeekDays(Enum): # as same as time_struct.wday
    MON = '一'
    TUE = '二'
    WED = '三'
    THU = '四'
    FRI = '五'
    SAT = '六'
    SUN = '日'

def renderSchedule(scheduleList):
    l = [('周次', '日期', '星期', '节次', '授课内容', '学时', '授课教师', '实习内容', '学时')]
    for s in scheduleList:
        weekNum = s['weekNum']
        date = DateUtil.d2s(DateUtil.s2d(s['date']), __DATE_FORMAT)
        weekDay = WeekDays[s['weekDay']].value
        dayPeriod = s['dayPeriod']
        tech_content = ''
        teacher = ''
        opera_content = ''
        hours = ''
        r = (weekNum, date, weekDay, dayPeriod, tech_content, teacher, opera_content, hours)
        l.append(r)
    return l
