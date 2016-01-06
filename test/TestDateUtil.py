import unittest
import util.DateUtil as du

class Test(unittest.TestCase):


    def setUp(self):
        pass


    def tearDown(self):
        pass


    def testDateListGenerator(self):
        d = du.DateListGenerator()
        l = d.generateDateList('20150914 - 20160125', 'SAT, SUN, 20151001 - 20151007, 20160101')
        print(l)

    def testGetWeekCount(self):
        assert du.getWeekNum('20151026', '20150914') == 7

if __name__ == "__main__":
    #import sys;sys.argv = ['', 'Test.testName']
    unittest.main()