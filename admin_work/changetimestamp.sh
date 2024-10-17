# changing the timestamp on file
# in the working directory

# change to 2020 05 10
find . -print | while read filename; do touch -t 202005101024 "${filename}"; done
