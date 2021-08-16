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

########################################
# ffmpeg opus to ogg from webm youtube #
########################################


# .webm files can contain vorbis audio, but it can also contain opus audio
# Also an ogg file can contain both audio formats
# you can transfer the ogg audio from the video without the need to convert to an .ogg file

# ffmpeg -i "$INPUTFILE" -vn -c:a copy "$(basename "$INPUTFILE" .webm)".ogg

# If you need vorbis audio in an ogg container, but your .webm contains opus audio, then you need to transcode to ogg

# In oggenc, a -q 6 setting will result in a file with variable bitrate at about 192 kbps
# This is a setting where quality loss mostly will not be perceived anymore ("transparent")
# and is a setting optimal to achieve excellent quality at a minimum file size

# In ffmpeg, the corresponding option is -qscale:a 6:

# ffmpeg -i "$INPUTFILE" -vn -c:a libvorbis -qscale:a 6 "$(basename "$INPUTFILE" .webm)".ogg

# The range is -1 to 10, where 10 is very high quality
# The default is -qscale:a 3, which corresponds to an average bitrate of about 112
