import datetime
import time

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