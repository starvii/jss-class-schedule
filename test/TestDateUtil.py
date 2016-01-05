'''
Created on 2016年1月5日

@author: starvii
'''
import unittest
import util.DateUtil as du

class Test(unittest.TestCase):


    def setUp(self):
        pass


    def tearDown(self):
        pass


    def testDateUtil(self):
        d = du.DateUtil()
        l = d.generateDateList('20160101 - 20160201', '20160201, SAT, SUN')
        print(l)


if __name__ == "__main__":
    #import sys;sys.argv = ['', 'Test.testName']
    unittest.main()