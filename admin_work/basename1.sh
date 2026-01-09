########################################################################################
# basename command                                                                     #
# takes the filename without the extension if in working directory                     #
# takes the filename without the extension and pathway if not in the working directory #
########################################################################################

########################
# convert jpgs to tifs #
########################

# using convert from imagemagick

#!/bin/bash

for x in *.jpg
do
echo "converting $x"
convert "$(basename "$x" .jpg).tif
done
