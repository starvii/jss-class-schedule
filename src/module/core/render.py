from enum import Enum
import module.core.dateutil as DateUtil

_DATE_FORMAT = '%m-%d'

class WEEKDAYS(Enum): # as same as time_struct.wday
    MON = '一'
    TUE = '二'
    WED = '三'
    THU = '四'
    FRI = '五'
    SAT = '六'
    SUN = '日'

def __add_quota(l):
    return ['"{}"'.format(e) for e in l]

def csv_render(schedule_list):
    l = [','.join(__add_quota(('周次', '日期', '星期', '节次', '授课内容', '学时', 
                               '授课教师', '实习内容', '学时')))]
    for s in schedule_list:
        week_num = str(s['week_num'])
        date = DateUtil.d2s(DateUtil.s2d(s['date']), _DATE_FORMAT)
        week_day = WEEKDAYS[s['week_day']].value
        day_period = '(' + s['day_period'] + ')'
        tech_content = ''
        teacher = ''
        opera_content = ''
        hours = ''
        d = __add_quota((week_num, date, week_day, day_period, tech_content, 
                         hours, teacher, opera_content, hours))
        r = ','.join(d)
        l.append(r)
    return '\n'.join(l)

def simple_xls_render(schedule_list):
    l = ['\t'.join(('周次', '日期', '星期', '节次', '授课内容', 
                    '学时', '授课教师', '实习内容', '学时'))]
    for s in schedule_list:
        week_num = str(s['week_num'])
        date = DateUtil.d2s(DateUtil.s2d(s['date']), _DATE_FORMAT)
        week_day = WEEKDAYS[s['week_day']].value
        day_period = '(' + s['day_period'] + ')'
        tech_content = ''
        teacher = ''
        opera_content = ''
        hours = ''
        d = (week_num, date, week_day, day_period, tech_content, 
             hours, teacher, opera_content, hours)
        r = '\t'.join(d)
        l.append(r)
    return '\n'.join(l)