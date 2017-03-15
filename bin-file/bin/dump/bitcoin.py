#!/usr/bin/python3
import pip

# Installing Packager
def Install(package):
    pip.main(['install', package])

# Installing Packages
Install('requests')

#------------------

import requests
loopStat = 0

while loopStat == 0:
    btcLink = 'https://www.coinbase.com/'
    r = requests.get(btcLink)
    for bitcoinValue in r.text.split("\n"):
        if "1 BTC" in bitcoinValue:
            finalValueBitcoin = bitcoinValue.split('= $')[1]
            print('Current Price: ' + str(finalValueBitcoin))
