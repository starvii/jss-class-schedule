#!/usr/bin/python3
# -*- coding: utf8 -*-

import sys
import util.DateUtil as DateUtil
import core.Core as Core
import entity.OverAllWeekSchedule as schedule
import renderer.ScheduleRenderer as render

def main():
    if len(sys.argv) == 3:
        jiaoxuerili = sys.argv[1]
        kechengbiao = sys.argv[2]
    else:
        jiaoxuerili = '教学日历.txt'
        kechengbiao = '课程表.txt'
    with open(jiaoxuerili, 'r') as f:
        ls = f.readlines()
    ds = DateUtil.DateListGenerator().generateDateList(ls[0], ls[1])
    with open(kechengbiao, 'r') as f:
        ls = f.readlines()
    ss = [schedule.OverAllWeekScheduleObject.obejctFromString(l) for l in ls]
    t = Core.generateSchedule(ds, ss)
    t = render.renderSchedule(t)
    print(t)

if __name__ == '__main__':
    main()