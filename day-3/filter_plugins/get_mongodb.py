from __future__ import (absolute_import, division, print_function)
__metaclass__ = type

from ansible import errors

def get_mongodb(mongo_src,os_family,major_version,mongodb_version):
    result=[]
    dict={'RedHat':'rhel','Debian':'debian','Ubuntu':'ubuntu'}
    for i in range(len(mongo_src)):
        temp_src=mongo_src[i].split("-")
        if (dict[os_family]+major_version) in temp_src[3]:
            if mongodb_version in temp_src[4]:
                result = mongo_src[i]
    return result

class FilterModule(object):
    def filters(self):
        return {
            'get_mongo_src': get_mongodb
        }