#!/usr/bin/env python3
import json
import requests
import sys

baseUrl = 'https://min-api.cryptocompare.com/data/price?fsym=' 
sysargv = sys.argv[1] 
r = requests.get(baseUrl + sys.argv[1] + '&tsyms=USD').text
j = json.loads(r)
print('$' + str(j['USD']))
