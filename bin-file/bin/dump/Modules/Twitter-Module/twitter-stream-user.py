from twython import TwythonStreamer

APP_KEY = "XXXXXXXXXXXXXXXXXXXXXX"
APP_SECRET = "XXXXXXXXXXXXXXXXXXX"
OAUTH_TOKEN = "XXXXXXXXXXXXXXXXXX"
OAUTH_TOKEN_SECRET =  "XXXXXXXXXX"
AUTH_ENDPOINT = "authorize"

class MyStreamer(TwythonStreamer):
    def on_success(self, data):
        if 'text' in data:
            print data['text'].encode('utf-8')
        # self.disconnect()

    def on_error(self, status_code, data):
        print status_code, data

stream = MyStreamer(APP_KEY, APP_SECRET, OAUTH_TOKEN, OAUTH_TOKEN_SECRET)
stream.user(niranjanshr13)
