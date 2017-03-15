#!/bin/bash
D_DIR='/tmp/snd_rec/'
while :
do
arecord -q -f cd -t raw -d 600 | oggenc - -r -o "$D_DIR/audio.ogg"
sleep 1
# Want to archieve remove the below comment. Timestamp is 10 second faster than it should be.
# mv "$D_DIR/audio.ogg" "/tmp/snd_rec/backup/audio_$(date).ogg"
done
