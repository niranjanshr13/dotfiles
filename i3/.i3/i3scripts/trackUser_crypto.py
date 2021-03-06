#!/usr/bin/python3
import json
import requests
import sys

def checkBalance(coinName):
    baseUrl = 'https://min-api.cryptocompare.com/data/price?fsym='
    r = requests.get(baseUrl + coinName + '&tsyms=USD')
    bal = r.json()['USD']
    return bal

def scrapedData(urlId):
    r = requests.get('https://www.cryptocompare.com/portfolio-public/?id=' + urlId).text
    for x in r.split('\n'):
        if 'portfolioManager.setPortfolioData' in x:
            scraped = x.replace('  ','').replace('portfolioManager.setPortfolioData({"Data":','').split('Success')[0].replace(',"Response":"','')
    return scraped

if __name__ == '__main__':
    symBalance = {}
    balance = 0
    values = sys.argv[1].split(' ')
    for value in values:
        scraped = scrapedData(value)
        j = json.loads(scraped)
        totalCrypto = j[0]['Members']
        for x in range(len(totalCrypto)):
            symb = totalCrypto[x]['Coin']['Symbol']
            val = float(totalCrypto[x]['Amount'])
            if symb not in symBalance:
                symBalance[symb] = val
            else:
                symBalance[symb] = symBalance[symb] + val
    for key in symBalance.keys():
        bal = checkBalance(key)
        balance += float(bal) * float(symBalance[key])
    print(round(balance, 2))
