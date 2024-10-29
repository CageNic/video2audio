##################################################################################
# merge a video and audio stream                                                 #
# need the vcodec and acodec copy otherwise it re-encodes the video when mapping #
##################################################################################

#!/bin/bash

my_video=''
my_audio=''
my_output=''

ffmpeg -i "${my_video}" -i "${my_audio}" -map 0:v -map 1:a -vcodec copy -acodec copy "${my_output}"
exit
