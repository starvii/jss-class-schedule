import sys
import util.LogUtil

log = util.LogUtil.log

class OverAllWeekScheduleObject(object):
    '''
    classdocs
    '''


    def __init__(self):
        '''
        Constructor
        '''
        self.courseName = None
        self.weekDay = None
        self.dayPeriod = None
        self.classes = None
        self.weekPeriod = None

    @staticmethod
    def obejctFromString(string):
#===============================================================================
#外科护理学	TUE	AM12	9/10/助产	1-13
#外科护理学	TUE	AM345	1/2/3/4
#外科护理学	TUE	PM678	5/6/7/8
#外科护理学	THU	AM12	5/6/7/8
#外科护理学	FRI	AM12	1/2/3/4
#===============================================================================
        l = [s.strip() for s in string.strip().split('\t')]
        try:
            o = OverAllWeekScheduleObject()
            o.courseName = l[0]
            o.weekDay = l[1]
            o.dayPeriod = l[2]
            o.classes = l[3]
            try:
                wp = l[4].replace(' ', '').split('-')
                o.weekPeriod = (wp[0], wp[1])
            except Exception:
                o.weekPeriod = None
            return o
        except Exception:
            info = sys.exc_info()
            log.error(info)