from module.core import dateutil

def generate_schedule(datelist, week_schedule_list):
    l = []
    for date in datelist:
        wi = dateutil.weekday_index(date)
        wn = dateutil.week_num(date, datelist[0])
        for ws in week_schedule_list:
            if dateutil.WEEKDAYS[ws.weekDay] != wi:
                continue
            if ws.weekRange and (wn < ws.weekRange[0] 
                or wn > ws.weekRange[1]):
                continue
            s = {'week_num':wn,
                 'date':date, 'week_day':ws.weekDay, 'day_period':ws.dayPeriod}
            l.append(s)
    return l