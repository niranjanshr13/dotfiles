#!/usr/bin/env python3
import json
import requests
import sys

baseUrl = 'https://min-api.cryptocompare.com/data/price?fsym=' 
coin = sys.argv[1]

r = requests.get(baseUrl + coin + '&tsyms=USD').text
j = json.loads(r)
#rounding = round(j['USD'],3)
rounding = j['USD']
print('$' + str(rounding))
