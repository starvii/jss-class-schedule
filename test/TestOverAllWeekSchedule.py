import unittest
import entity.temp.overall_week_schedule as s
from util.log_util import default_logger as log

class Test(unittest.TestCase):


    def setUp(self):
        pass


    def tearDown(self):
        pass


    def testObejctFromString(self):
        x = s.OverAllWeekScheduleObject.obejct_from_string('外科护理学	TUE	AM1-2	9/10/助产	1-13')
        log.debug(x)
        log.debug(x.week_period)
        log.debug(s.OverAllWeekScheduleObject.obejct_from_string('外科护理学	TUE	AM3-5	1/2/3/4'))
        log.debug(s.OverAllWeekScheduleObject.obejct_from_string('外科护理学	TUE	PM6-8	5/6/7/8'))
        log.debug(s.OverAllWeekScheduleObject.obejct_from_string('外科护理学	THU	AM1-2	5/6/7/8'))
        log.debug(s.OverAllWeekScheduleObject.obejct_from_string('外科护理学	FRI	AM1-2	1/2/3/4'))
        log.debug(s.OverAllWeekScheduleObject.obejct_from_string('外科护理学    FRI    AM1-2    1/2/3/4'))

if __name__ == "__main__":
    #import sys;sys.argv = ['', 'Test.testName']
    unittest.main()