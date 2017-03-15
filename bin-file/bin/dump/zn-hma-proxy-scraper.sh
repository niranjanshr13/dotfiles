#!/bin/bash
# Downloading proxy module
echo "var hma = require('hma-proxy-scraper');" > /tmp/hma-proxy.js
echo "hma.getProxies(function (err,proxies) {" >> /tmp/hma-proxy.js
echo "if(err)" >> /tmp/hma-proxy.js
echo "throw err" >> /tmp/hma-proxy.js
echo "console.log(proxies)" >> /tmp/hma-proxy.js
echo "});" >> /tmp/hma-proxy.js
nodejs /tmp/hma-proxy.js | sed 's/}//g' | sed 's/{//g' | sed "s/'//g" | sed 's/ //g' | sed 's/,//g' > /tmp/hma-proxy.txt
cat /tmp/hma-proxy.txt | grep -v 'collect' > /tmp/hma-proxy2.txt
rm '/tmp/hma-proxy.txt'
rm '/tmp/hma-proxy.js'
cat /tmp/hma-proxy2.txt | view -
