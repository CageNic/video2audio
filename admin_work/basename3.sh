#########################################################
# basename command                                      #
# take current working directory from pwd absolute path #
#########################################################

# uses zipinfo to get information from zip file


#!/bin/bash

#############################################################
# zips codes reccodes files for consultations               #
# when codes reccodes are zipped                            #
# the original codes reccodes can be deleted or overwritten #
#############################################################

# only want the current directory as the name of zip file
# not the whole pathway

CURRENT=$(pwd)
BASENAME=$(basename "$CURRENT")

# echo "$BASENAME"

# date appended to zip file name
DATE=$(date +%d-%m-%Y)

zip "$BASENAME-$DATE.zip" codes reccodes

# use zipinfo command

##############################################
# send STDOUT of zipinfo report to /dev/null #
# replace STDOUT with echo statement         #
##############################################

if zipinfo "$BASENAME-$DATE.zip" > /dev/null ;
	then
	echo "Looks good - you've zipped the files"
else
	echo "Zip file looks empty - try again"
fi
