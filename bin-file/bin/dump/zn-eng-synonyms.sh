curl -s "http://www.wordhippo.com/what-is/another-word-for/$1.html" | grep '<div class="wordblock">' | grep -o "html.*</a>" | sed 's/html">//g' | sed 's/<\/a>//g' | sort | uniq | sort -r | head -$2
