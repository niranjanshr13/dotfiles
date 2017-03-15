#!/usr/bin/env python3
import sys
import pip


# Installing Package
def Install(package):
    pip.main(['install', package])

try:
    import smtplib
except ImportError:
    Install('smtplib')
    import smtplib

gmailUser = sys.argv[1]
gmailPass = sys.argv[2]
userTo = sys.argv[3]
Message = sys.argv[4]



server = smtplib.SMTP()
server.connect('smtp.gmail.com','587')
server.ehlo()
server.starttls()
server.login(gmailUser, gmailPass)
server.sendmail(gmailUser, userTo, Message)
print('Message is send')
