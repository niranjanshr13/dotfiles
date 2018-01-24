#!/usr/bin/env python3
#{{{ Variables
import requests
import os
import sys
#}}}
#{{{ Variables
secretKey = os.environ['AUTOREMOTE_KEY']
value = sys.argv[1]
#}}}
requests.get('http://autoremotejoaomgcd.appspot.com/sendmessage?key=' + str(secretKey) + '&message=' + str(value))
