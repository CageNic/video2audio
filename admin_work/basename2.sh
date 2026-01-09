########################################################################################
# basename command                                                                     #
# takes the filename without the extension if in working directory                     #
# takes the filename without the extension and pathway if not in the working directory #
########################################################################################

########################
# convert jpgs to tifs #
########################

# using convert from imagemagick
# loop to find all jpg files in subfolders - using find command

#!/bin/bash

for x in $(find -iname *.jpg)
do
echo "converting $x"
convert "$(basename "$x" .jpg).tif
done
