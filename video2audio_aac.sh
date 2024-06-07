#!/bin/bash

cd /home/alice/forsynologyWD1tb/music/tracks
yt-dlp -f 140 $1
rename 's/.m4a$/.aac/g' *.m4a
rename 's/\[.*\]/ /g' *.aac
rename 's/  ?.aac$/.aac/g' *.aac
exit
