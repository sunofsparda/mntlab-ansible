from __future__ import (absolute_import, division, print_function)
__metaclass__ = type
from ansible import errors
import re

dict={'RedHat':'rhel','Debian':'debian','Ubuntu':'ubuntu'}

class FilterModule(object):

    def filters(self):
        return {
            'get_mongo_src': get_mongo_src,
        }

def get_mongo_src(mongo_src, os_family, major_version, mongodb_version):    
    result = []

    for i in range(len(mongo_src)):
        if ((dict[os_family] + major_version) in mongo_src[i]) and (str(mongodb_version) in mongo_src[i]):
            result.append(mongo_src[i])
    return "Recomended MongoDB versions for {} distro are: {}".format(os_family, result)
