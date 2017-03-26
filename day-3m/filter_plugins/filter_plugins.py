from __future__ import (absolute_import, division, print_function)
__metaclass__ = type

from ansible import errors

def my_filter1(arg):
   result = []
   return result

def my_filter2(arg, ob=[]):
   result = []
   return result

class FilterModule(object):
   def filters(self):
      return {
             'my_filter1': my_filter1,
             'my_filter2': my_filter2
             }
