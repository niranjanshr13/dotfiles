import sys
from twython import Twython
# Variable name can be simplified.
CONSUMER_KEY ="XXXXXXXXXXXXXXXXXXXXXXXXX"
CONSUMER_SECRET = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"   
ACCESS_KEY = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"    
ACCESS_SECRET = "XXXXXXXXXXXXXXXXXXXXXXXXXXXX"

api = Twython(CONSUMER_KEY,CONSUMER_SECRET,ACCESS_KEY,ACCESS_SECRET) 
# Use the Argrument(1) as variable to post a status
api.update_status(status=sys.argv[1])
# Character Limit of 140
# api.update_status(status=sys.argv[1][:140])
