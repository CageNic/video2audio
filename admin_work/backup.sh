#!/bin/bash

# Simple program to make a backup of files on the Raspberry Pi
# Set the location of my files and the backup location

backup="/pma/andyc/backup"

mydirectory="/home/users/andyc"

echo "Starting backup of files from $mydirectory to $backup"

# Check if the backup directory exists

if [ ! -d $backup ]
then

# Does not exist, need to make a new directory

echo "Making new directory $backup"
sudo mkdir $backup

# Change owner of this directory to the user pi

# sudo chown pi $backup
fi

# Copy all the files in my directory
# recursive means keep drilling down into directories to find files
# update means only copy files that have been changed since the last backup
# verbose means I want to be told what is happening

cp --recursive --update --verbose $mydirectory $backup
echo "Backup is finished"
