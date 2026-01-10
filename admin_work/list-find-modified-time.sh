ls -lt --time atime
# same as ls -lt
# both show folder modification date
# t is for sorting by date
# use awk for ouput filtering

ls -lt| awk '{print $6,$7,$8,$9}'

# better formatting
ls -lt | awk '{print $6"-"$7"-"$8,$9}'

# do something with penultimate field, if a time rather than year - it gets current year
# then current year can be used instead of the time given, so that everything has a year

Dec-11-17:21 Downloads
Dec-11-16:17 OU
Dec-11-16:17 forsynologyWD1tb
Dec-10-12:20 Calibre
Dec-10-12:19 Perl
Dec-4-23:45 forseagatewd2tb
Nov-8-14:56 forseagateWD1tb
Oct-27-20:49 Documents
Sep-19-14:55 R
Mar-13-2022 snap
Feb-13-2022 Chromebook.pdf
Dec-19-2021 Music
Dec-19-2021 Pictures
Dec-19-2021 Public
Dec-19-2021 Videos
Dec-19-2021 Desktop
Dec-19-2021 Templates


# find command

# find directories with modification time less than 1 day
# not using min or max depth to limit sub-directories

find /home -mtime -1 -type d -print

# good resource examples
https://alvinalexander.com/unix/edu/examples/find.shtml
