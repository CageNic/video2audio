gzip
You can compress a file using the gzip compression protocol named LZ77
using the gzip command.
Here's the simplest usage:

gzip filename

This will compress the file, and append a .gz extension to it. The original
file is deleted. To prevent this, you can use the -c option and use output
redirection to write the output to the filename.gz file:

gzip -c filename > filename.gz

The -c option specifies that output will go to the standard output
stream, leaving the original file intact
Or you can use the -k option:

gzip -k filename

There are various levels of compression. The more the compression, the
longer it will take to compress (and decompress). Levels range from 1
(fastest, worst compression) to 9 (slowest, better compression), and the
default is 6.
You can choose a specific level with the -<NUMBER> option:

gzip -1 filename

You can compress multiple files by listing them:

gzip filename1 filename2

26
You can compress all the files in a directory, recursively, using the -r
option:

gzip -r a_folder

The -v option prints the compression percentage information. Here's an
example of it being used along with the -k (keep) option:

gzip can also be used to decompress a file, using the -d option:

gzip -d filename.gz

27
gunzip
The gunzip command is basically equivalent to the gzip command,
except the -d option is always enabled by default.
The command can be invoked in this way:

gunzip filename.gz

This will gunzip and will remove the .gz extension, putting the result in the
filename file. If that file exists, it will overwrite that.
You can extract to a different filename using output redirection using the -c
option:

gunzip -c filename.gz > anotherfilename