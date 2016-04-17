#!/usr/bin/python3
# -*- coding: utf8 -*-

import sys
import util.date_util as DateUtil
import core.core as Core
import entity.temp.overall_week_schedule as schedule
import renderer.schedule_renderer as render

def main():
    if len(sys.argv) == 3:
        jiaoxuerili = sys.argv[1]
        kechengbiao = sys.argv[2]
    else:
        jiaoxuerili = '教学日历.txt'
        kechengbiao = '课程表.txt'
    with open(jiaoxuerili, 'r') as f:
        ls = f.readline()
    ds = DateUtil.DateListGenerator().generate_date_list(ls)
    with open(kechengbiao, 'r') as f:
        ls = f.readlines()
    ss = [schedule.OverAllWeekScheduleObject.obejct_from_string(l) for l in ls]
    t = Core.generate_schedule(ds, ss)
    
    render_func = render.csv_render
#     render_func = render.simple_xls_render
    t = render_func(t)
    with open('out.csv', 'w', encoding = 'cp936') as f:
        f.write(t)

if __name__ == '__main__':
    main()