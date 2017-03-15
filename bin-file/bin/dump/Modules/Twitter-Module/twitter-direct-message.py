from twython import Twython

APP_KEY = "XXXXXXXXXXXXXXXXXXXXXX"
APP_SECRET = "XXXXXXXXXXXXXXXXXXXX"
OAUTH_TOKEN = "XXXXXXXXXXXXXXXXXXXXX"
OAUTH_TOKEN_SECRET =  "XXXXXXXXXXXXXXXXXXX"

#startTime = datetime.now()

twitter = Twython(APP_KEY, APP_SECRET, OAUTH_TOKEN, OAUTH_TOKEN_SECRET)

#Sends a private message
#twitter.send_direct_message(user_id="FromUserNo@", screen_name="FromUserNo@", text= ' bonjour ')
stream.statuses.filter(track=TERMS, follow=niranjanshr13)
#sends a public message
#twitter.update_status(status="BLA BLA")

print ("DM SENT IN")
#print (datetime.now()-startTime)
