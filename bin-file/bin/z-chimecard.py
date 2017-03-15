#!/usr/bin/python3
import sys 
from bs4 import BeautifulSoup
from selenium import webdriver
driver = webdriver.PhantomJS()

userName = ''
passWord = ''

link = 'https://www.chimecard.com/member/sign_in'

driver.get('link')
driver.find_element_by_xpath('/html/body/div[2]/div[3]/div/div/form/input').send_keys(userName)
driver.find_element_by_xpath('/html/body/div[2]/div[3]/div/div/form/input[2]').send_keys(passWord)
driver.find_element_by_xpath('/html/body/div[2]/div[3]/div/div/form/input[3]').click()
driver.get('https://www.chimecard.com/member/rewards#/')
webpage = driver.page_source
bs = BeautifulSoup(webpage, 'lxml')
findingValues = bs.findAll("span", {"class": "merchant-name"}, text=True)
bsConvert = BeautifulSoup(str(findingValues))
bsConvert.findAll(text=True)
