'''
@license: MIT
@author: starvii
'''
from enum import Enum
import datetime
import time
import sys
import util.LogUtil

log = util.LogUtil.log

__DATE_FORMAT = '%Y%m%d'
# __DATE_DELTA = datetime.timedelta(days = 1)

class WeekDays(Enum): # as same as time_struct.wday
    MON = 0
    TUE = 1
    WED = 2
    THU = 3
    FRI = 4
    SAT = 5
    SUN = 6

def d2s(date, formatter = None):
    '''
    date to string
    @param date: 
    '''
    f = formatter if formatter else __DATE_FORMAT
    return date.strftime(f)

def s2d(strDate, formatter = None):
    '''
    string to date
    
    '''
    f = formatter if formatter else __DATE_FORMAT
    time_struct = time.strptime(strDate, f)
    timestamp = time.mktime(time_struct)
    date = datetime.date.fromtimestamp(timestamp)
    return date

def weekday(strDate):
    return time.strptime(strDate, __DATE_FORMAT).tm_wday

def getWeekNum(strCurrentDate, strFisrtDate):
    currentDate = s2d(strCurrentDate)
    firstDate = s2d(strFisrtDate)
    delta = currentDate - firstDate
    days = delta.days
    weeks = days // 7 + 1
    return weeks

class DateListGenerator(object):

    def __init__(self):
        self.__DATE_DELTA = datetime.timedelta(days = 1)

    def generateDateList(self, strDateRange, strDateExclude):
        includeDateSet, icWeekSet = self.__splitDateRange2Set(strDateRange)
        excludeDateSet, exWeekSet = self.__splitDateRange2Set(strDateExclude)
        dateSet = includeDateSet.difference(excludeDateSet)
        
        icWeekSet = icWeekSet if len(icWeekSet) > 0 else set(WeekDays.__members__.keys())
        weekSet = icWeekSet.difference(exWeekSet)
        icWeekSet = set([WeekDays[k].value for k in weekSet])
        exWeekSet = set([WeekDays[k].value for k in WeekDays.__members__.keys()]).difference(icWeekSet)
        
        dateSet = filter(lambda x: weekday(x) not in exWeekSet, dateSet)
        dateList = list(dateSet)
        dateList.sort()
        return dateList


    def __splitDateRange2Set(self, strDateRange):
        dateSet = set()
        a = strDateRange.split(',')
        weekdaySet = set()
        for e in a:
            try:
                d = e.strip()
                if d in WeekDays.__members__:
                    weekdaySet.add(d)
                elif '-' in d: # date range
                    sdr = [s for s in d.replace(' ', '').split('-')]
                    if len(sdr) != 2:
                        raise Exception('format of "{}" is error.'.format(d))
                    else:
                        ds1 = self.__singleDateRange2Set(sdr[0], sdr[1])
                        dateSet.update(ds1)
                else: # single date
                    s2d(d) # checking date format valid.
                    dateSet.add(d)
            except Exception:
                info = sys.exc_info()
                log.error(info)
        
        return dateSet, weekdaySet
    
    def __singleDateRange2Set(self, strDateStart, strDateEnd):
        dset = set()
        ds = s2d(strDateStart)
        de = s2d(strDateEnd)
        d = ds
        while d <= de:
            dset.add(d2s(d))
            d = d + self.__DATE_DELTA
        return dset
