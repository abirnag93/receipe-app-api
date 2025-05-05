from django.test import SimpleTestCase
from . import calc
class CalculateTest(SimpleTestCase):
    def testAddNumbers(self):
        res = calc.add(12,12)
        self.assertEqual(res,24 ,"Not Matched")
    def testSubtractNumbers(self):
        res = calc.subtract(12,3)
        self.assertEqual(res,9)