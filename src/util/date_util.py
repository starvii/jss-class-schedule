import datetime
import time
import sys
import re
from util.log_util import default_logger as log

DATE_FORMAT = '%Y%m%d'
_DATE_1DAY_DELTA = datetime.timedelta(days = 1)

WEEKDAYS = {'MON': datetime.date(1,1,1).weekday(),
            'TUE': datetime.date(1,1,2).weekday(),
            'WED': datetime.date(1,1,3).weekday(),
            'THU': datetime.date(1,1,4).weekday(),
            'FRI': datetime.date(1,1,5).weekday(),
            'SAT': datetime.date(1,1,6).weekday(),
            'SUN': datetime.date(1,1,7).weekday(),}

def d2s(date, formatter = None):
    ''' date to string '''
    fmt = formatter if formatter else DATE_FORMAT
    return date.strftime(fmt)

def s2d(str_date, formatter = None):
    ''' string to date '''
    fmt = formatter if formatter else DATE_FORMAT
    time_struct = time.strptime(str_date, fmt)
    timestamp = time.mktime(time_struct)
    date = datetime.date.fromtimestamp(timestamp)
    return date

def weekday_index(str_date):
    return time.strptime(str_date, DATE_FORMAT).tm_wday

def week_num(str_current_date, str_fisrt_date):
    current_date = s2d(str_current_date)
    first_date = s2d(str_fisrt_date)
    delta = current_date - first_date
    days = delta.days
    weeks = days // 7 + 1
    return weeks

class DateListGenerator(object):

    def __init__(self):
        pass
#         self.__DATE_DELTA = datetime.timedelta(days = 1)

    def generate_date_list(self, str_date_range):
        tmp = re.split('[\{\}]', str_date_range.replace(' ', ''))
        tmp = list(filter(lambda x: len(x.strip()) > 0, tmp))
        ranges = list(filter(lambda x: x != '+' and x != '-', tmp))
        operators = list(filter(lambda x: x == '+' or x == '-', tmp))
        if len(ranges) != len(operators) + 1:
            raise Exception('format of DATE_RANGE is error.')
        date_set, week_set = self.__split_date_range_set_to_set(ranges[0])
        if len(week_set) == 0:
            week_set = set([WEEKDAYS.values()])
        for i in range(len(operators)):
            ds, ws = self.__split_date_range_set_to_set(ranges[i + 1])
            if operators[i] == '-':
                date_set.difference_update(ds)
                week_set.difference_update(ws)
                ex_ws = set([WEEKDAYS.values()]).difference(week_set)
                date_set = set(filter(lambda x: weekday_index(x) not in ex_ws, 
                                  date_set))
            elif operators[i] == '+':
                date_set.update(ds)
            else:
                raise Exception('format of OPERATOR is error.')
        date_list = list(date_set)
        date_list.sort()
        return date_list

    def __split_date_range_set_to_set(self, str_date_range_set):
        date_set = set()
        weekday_set = set()
        list_str_date_range = str_date_range_set.split(',')
        for e in list_str_date_range:
            try:
                el = e.strip()
                if el in WEEKDAYS:
                    weekday_set.add(WEEKDAYS[el])
                elif '-' in el: # date range
                    sdr = [s for s in el.replace(' ', '').split('-')] # single date range set
                    if len(sdr) != 2:
                        raise Exception('format of "{}" is error.'.format(el))
                    else:
                        ds = self.__single_date_range_to_set(sdr[0], sdr[1])
                        date_set.update(ds)
                else: # single date
                    s2d(el) # checking date format valid.
                    date_set.add(el)
            except Exception:
                info = sys.exc_info()
                log.error(info)
        return date_set, weekday_set
    
    def __single_date_range_to_set(self, str_date_start, str_date_end):
        dateset = set()
        ds = s2d(str_date_start)
        de = s2d(str_date_end)
        d = ds
        while d <= de:
            dateset.add(d2s(d))
            d = d + _DATE_1DAY_DELTA
        return dateset
