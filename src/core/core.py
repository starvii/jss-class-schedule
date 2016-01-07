import util.date_util as DateUtil

def generate_schedule(datelist, week_schedule_list):
    l = []
    for date in datelist:
        wi = DateUtil.weekday_index(date)
        wn = DateUtil.week_num(date, datelist[0])
        for ws in week_schedule_list:
            if DateUtil.WEEKDAYS[ws.week_day] != wi:
                continue
            if ws.week_period and (wn < ws.week_period[0] 
                or wn > ws.week_period[1]):
                continue
            s = {'week_num':wn,
                 'date':date, 'week_day':ws.week_day, 'day_period':ws.day_period}
            l.append(s)
    return l