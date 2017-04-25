#!/usr/bin/env python3

'''
What it is ?
    download books from safaribooksonline.com
    change the range number
'''
#{{{ Importing Module
from selenium import webdriver
import time
import sys
#}}}
#{{{ Variable
userName = sys.argv[1]
passWord = sys.argv[2]
#}}}
#{{{ Login in
w = webdriver.PhantomJS()
link = 'https://www.safaribooksonline.com/accounts/login/'
w.get(link)
w.find_element_by_xpath('/html/body/div/article/section/div/form/input[2]').send_keys(userName)
w.find_element_by_xpath('/html/body/div/article/section/div/form/div/input').send_keys(passWord)
w.find_element_by_xpath('/html/body/div/article/section/div/form/div[2]/input').click()
w.set_window_size(1400,1000)
#}}}
w.get('https://www.safaribooksonline.com/library/view/openvpn-cookbook-/9781786463128/pr01.html')
for x in range(0,100):
    w.find_element_by_xpath('//*[@id="container"]/div[2]/section/div[2]/a').click()
    w.save_screenshot(str(x) + '.jpg')
    time.sleep(2)

