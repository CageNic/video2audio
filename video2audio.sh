#!/bin/bash

# transcode audio formats
# caters for video files to extract audio only

for i  in *.m4a    # audio only

# for i  in *.webm # audio and video (video and audio files can both be saved as webm - although audio is not webm)

# for i in *.mkv

#----------------------#
# transcode mp4 to mp3 #
#----------------------#

ffmpeg -i "${i}" -vn -acodec libmp3lame -ac 2 -ab 320k "${i}".mp3

#----------------------------------------------------------------------------------------#
# strip native ogg from video (ogg no longer supported as native audio in youtube video) #
#----------------------------------------------------------------------------------------#

# ffmpeg -i "${i}" -vn -acodec copy "${i}".ogg

#------------------------------#
# strip native opus from video #
#------------------------------#

# ffmpeg -i "${i}" -vn -acodec copy "${i}".opus

done

#---------------------------------------------------------------------------------------------------------#
# rename files so that they don't get original and new file extensions - only the extension transcoded to #
#---------------------------------------------------------------------------------------------------------#

# rename s/\.webm\.opus/\.opus/g *.webm.opus

# rename s/\.m4a\.mp3/\.mp3/g *.m4a.mp3

# rm *.webm

# rm *.m4a
