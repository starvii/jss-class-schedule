import unittest
import util.DateUtil as du

class Test(unittest.TestCase):


    def setUp(self):
        pass


    def tearDown(self):
        pass


    def testDateListGenerator(self):
        d = du.DateListGenerator()
        l = d.generateDateList('20160101 - 20160201', '20160201, SAT, SUN')
        print(l)

    def testGetWeekCount(self):
        assert du.getWeekNum('20151026', '20150914') == 7

if __name__ == "__main__":
    #import sys;sys.argv = ['', 'Test.testName']
    unittest.main()