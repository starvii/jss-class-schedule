import util.DateUtil as DateUtil
import util.LogUtil

log = util.LogUtil.log

def generateSchedule(dateList, weekScheduleList):
    l = []
    for date in dateList:
        w = DateUtil.weekday(date)
        wn = DateUtil.getWeekNum(date, dateList[0])
        for ws in weekScheduleList:
            if DateUtil.WeekDays[ws.weekDay].value != w:
                continue
            if ws.weekPeriod and (wn < ws.weekPeriod[0] or wn > ws.weekPeriod[1]):
                continue
            s = {'weekNum':DateUtil.getWeekNum(date, dateList[0]),
                 'date':date, 'weekDay':ws.weekDay, 'dayPeriod':ws.dayPeriod}
            l.append(s)
    return l