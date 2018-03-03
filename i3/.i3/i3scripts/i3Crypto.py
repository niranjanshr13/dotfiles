#!/usr/bin/python3
import requests
import sys

def crypto(coin):
    baseUrl = 'https://min-api.cryptocompare.com/data/price?fsym=' 
    coin = str(coin).upper()
    r = requests.get(baseUrl + coin + '&tsyms=USD').json()
    rounding = round(r['USD'],3)
    return str(rounding)

if __name__ == '__main__':
    final = crypto(sys.argv[1])
    print(final)
