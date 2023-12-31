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

#######################################################################
# youtube mkv and webm to avi using xvid video container and mp3 audio #
# works for archos 5                                                  #
#######################################################################

ffmpeg -i inputfile.webm -vcodec libxvid -b 1000k -acodec libmp3lame -ac 2 -ar 44100 -ab 128k outputfile.avi


# if the frame size is too big for archos 5...

# -s for the frame size
# -q:v 0 to keep the same video quality

ffmpeg -i inputfile.avi -s 720x576 -q:v 0 outputfile.avi

# but this is not to be confused with changing the aspect ratio
# so if the video is 4:3 the aspect ratio can be changed to 16:9

ffmpeg -i inputfile.avi -vf scale=720:576,setdar=16:9 -q:v 0 outputfile.avi


# this works - only having to use 1 command
# haven't specified a video codec bit rate

ffmpeg -i input.mkv -vcodec libxvid -vf scale=720:576,setdar=16:9 -q:v 0 -acodec libmp3lame -ac 2 -ar 44100 -ab 128k output.avi

##############
# youtube-dl #
##############

# downloading video and audio separately
# merging the video and audio file
# creates smaller file size than downloading the options of video and audio together

# download high quality video only webm
# download high quality audio only opus

# mv the webm video to webm.bak
# run the video2audio_updated.sh script so that the opus audio file (which is .webm) is re-named to opus
# mv the video file .web.bak to .web

# Make sure that the audiofile and the videofile have the same duration

# Usually the videostream is mapped as first stream in the container

# run this command

ffmpeg -i videofile.webm -i audio.opus -map 0:0 -map 1:0 -vcodec copy -acodec copy videoandaudiofile.webm

# explanation of the options
# -i videofile       -> first media file
# -i audiofile.opus  -> second media file
# -map 0:1      -> use the second stream from the first mediafile
# -map 1:0      -> use the first stream from the second mediafile
# -vcodec copy  -> leave the video as is
# -acodec copy  -> leave the audio as is
# newvideo      -> resulting videofile

######################################################
# concatenate mp4 files ffmpeg filter_complex concat #
######################################################

# check with ffprobe that the video stream is 0 and the audio stream is 1 (in all input files)
n = (number of files to concatenate)

ffmpeg -i file1.mp4 -i file2.mp4 -filter_complex "[0:v] [0:a]
[1:v] [1:a]  concat=n=2:v=1:a=1 [v] [a]" -map "[v]" -map "[a]" output.mp4

concat=n=the number of files
[0:v] [0:a] represents video and audio for first file
[1:v] [1:a] represents video and audio for second file

If there was a third file it would be; ffmpeg -i file1.mp4 -i file2.mp4 -i file3.mp4 -filter_complex "[0:v] [0:a]
[1:v] [1:a] [2:v] [2:a]  concat=n=3:v=1:a=1 [v] [a]" -map "[v]" -map "[a]" output.mp4



