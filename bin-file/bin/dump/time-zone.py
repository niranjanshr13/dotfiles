#!/usr/bin/python3
from datetime import datetime
from pytz import timezone
fmt = "%H:%M"

# Current time in UTC
now_utc = datetime.now(timezone('UTC'))
now_pacific = now_utc.astimezone(timezone('Asia/Kathmandu'))
print(now_pacific.strftime(fmt))
