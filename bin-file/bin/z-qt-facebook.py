#!/usr/bin/python
'''
Things it does:
    1. create a web-browser.
    2. goes to facebook and logs in it.

Things it should do:
    1. after loggin in go to facebook mobile version without having to do anything
        -   mobile.facebook.com
        -   touch.facebook.com
'''

import sys
import time
from PyQt4.QtGui import *
from PyQt4.QtCore import *
from PyQt4.QtWebKit import *


# variable's
Title = 'qt4.web.facebook'
userName = sys.argv[1]
passWord = sys.argv[2]


def fill_login_form( web, username, password):
    doc = web.page().mainFrame().documentElement()
    user = doc.findFirst("input[id=email]")
    passwd = doc.findFirst("input[id=pass]")

    user.evaluateJavaScript("this.value = '%s'" % username)
    passwd.evaluateJavaScript("this.value = '%s'" % password)
    button = doc.findFirst("label[id=loginbutton]")
    button.evaluateJavaScript("this.click()")


def do_login(web, url, username, password):
    web.loadFinished.connect(lambda: fill_login_form(web, username, password))
    web.load(url)


if __name__ == "__main__":
    app = QApplication(sys.argv)
    web = QWebView()
    web.setWindowTitle(Title)
    url = QUrl(r"https://facebook.com")
    username = userName
    password = passWord
    web.show()
    do_login(web, url, username, password)
    sys.exit(app.exec_())
