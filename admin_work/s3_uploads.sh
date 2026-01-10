############
# date_ymd #
############

#!/bin/bash

dmy=$(date '+%d-%m-%Y')
echo $dmy

my_dir=$dmy

##################
# array of files #
##################

#!/usr/bin/bash

# script to upload files to s3 bucket/folder
# looping through an array to declare specific files to upload
# negates the need to use compicated aws s3 -- inlcusion -- exlusion options
# easiest to run script in same directory the files are in
# else have to inlcude the filepath of files in the array

array_of_files=(upload_file.html upload.txt)

bucket="s3://xxxx"      
folder="Andrew"

for file in "${array_of_files[@]}"
do
  aws s3 cp ${file} "${bucket}/${folder}/${file}"
done

# test the result of the looped copy command to s3
# 0 is TRUE (success) 1 = FAIL (failure) in Bash
# opposite to most languages

result=$?
if [ $result -ne "0" ]; 
then
	echo "copy of $file failed"
	exit 1
fi
exit

#################
# aws s3 upload #
#################

#!/bin/bash
FILES='path/to/dir/*'
DESTINATION='MyAWSBucket/MyFolder'
for file in $FILES
do
     FILENAME=$(basename $file)
     BASE64=$(openssl md5 -binary $file | base64)
     aws s3 cp $file s3://$DESTINATION/$FILENAME --metadata content-md5=$BASE64
done

####################################
# aws s3 upload local to s3 bucket #
####################################

#!/usr/bin/bash

# script to upload file to s3 bucket/folder

bucket="s3://xxxx"
folder="Andrew"
file="upload_file.R"

aws s3 cp ${file} ${bucket}/${folder}

# test the result of the copy command to s3
# 0 is TRUE (success) 1 = FAIL (failure) in Bash
# opposite to most languages

result=$?
if [ $result -ne "0" ]; 
then
	echo "copy of $file failed"
	exit 1
fi
exit
