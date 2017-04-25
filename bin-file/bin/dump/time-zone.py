#!/usr/bin/env python3
#{{{ Importing Module
from datetime import datetime
from pytz import timezone
fmt = "%H:%M"
#}}}
#{{{ Current time in UTC
now_utc = datetime.now(timezone('UTC'))
now_pacific = now_utc.astimezone(timezone('Asia/Kathmandu'))
print(now_pacific.strftime(fmt))
#}}}
