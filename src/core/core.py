import util.date_util as DateUtil

'''
模块主要工作流程：
1、载入数据（需要编排课程表的年份）
2、查找冲突域
3、每个冲突域进行单独计算（可以采用模拟退火算法、遗传算法等）
4、生成最优近似解
'''

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

def conflict_set(key):
    '''查找冲突域
    '''
    pass