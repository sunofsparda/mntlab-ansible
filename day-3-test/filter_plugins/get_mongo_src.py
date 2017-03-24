from __future__ import (absolute_import, division, print_function)
__metaclass__ = type

from ansible import errors

def get_mongo_src(mongo_src, os_family, os_release, mongodb_version):
   os_map = {'CentOS': 'rhel',
             'Red Hat Enterprise Linux': 'rhel',
             'Ubuntu' : 'ubuntu',
             'Debian' : 'debian'}
   result = []
   for src in mongo_src:
       for n in range(9):
           if '%s%s%s-%s' % (os_map[os_family], os_release, n, mongodb_version) in src:     
	       result.append(src)
     
   return result

def my_filter2(arg, ob=[]):
   result = []
   return result

class FilterModule(object):
   def filters(self):
      return {'get_mongo_src': get_mongo_src}
