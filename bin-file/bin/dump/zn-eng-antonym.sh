curl -s "http://www.wordhippo.com/what-is/the-opposite-of/$@.html" | grep '<div class="wordblock">' | grep -o "html.*</a>" | sed 's/html">//g' | sed 's/<\/a>//g'
