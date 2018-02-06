#!/usr/bin/python3
import os
import requests

OS_ZIPCODE = os.environ['ZIPCODE']

r = requests.get('https://www.accuweather.com/en/us/corona-ny/' + str(OS_ZIPCODE) + '/weather-forecast/4150_pc').text

def degree(r):
    for x in r.split('\n'):
        if 'large-temp' in x:
            scraped = x.split('>')[1].split('&')[0]
            return scraped
            break


def condition(r):
    for x in r.split('\n'):
        if 'cond' in x:
            scraped = x.split('>')[1].split('<')[0]
            return scraped
            break

if __name__ == '__main__':
    degreeX = degree(r)
    print('a')
    conditionX = condition(r)
    print(str(degreeX) + ' ' + str(conditionX))
