#############################################################################
# yt-dlp scipt to download individual tracks within a compliation of tracks #
# for audio only                                                            #
# downloads in m4a needs renaming to aac for mp3 player                     #
# time in seconds                                                           # 
#############################################################################

#!/bin/bash

# 3 minute song
start=0
stop=120

url=

yt-dlp $url&$start=$start&end=$stop -f 140
rename 's/\.m4a$/.aac/g'
