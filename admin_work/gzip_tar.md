## gzip
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

You can compress all the files in a directory, recursively, using the -r
option:

gzip -r a_folder

The -v option prints the compression percentage information. Here's an
example of it being used along with the -k (keep) option:

![image](https://github.com/CageNic/video2audio/blob/master/admin_work/gzip.png)

gzip can also be used to decompress a file, using the -d option:

gzip -d filename.gz

## gunzip
The gunzip command is basically equivalent to the gzip command,
except the -d option is always enabled by default.
The command can be invoked in this way:

gunzip filename.gz

This will gunzip and will remove the .gz extension, putting the result in the
filename file. If that file exists, it will overwrite that.
You can extract to a different filename using output redirection using the -c
option:

gunzip -c filename.gz > anotherfilename

## tar

The tar command is used to create an archive, grouping multiple files in a
single file.
Its name comes from the past and means tape archive. Back when archives
were stored on tapes.
This command creates an archive named archive.tar with the content of
file1 and file2 :

tar -cf archive.tar file1 file2

The c option stands for create. The f option is used to write to file
the archive.
To extract files from an archive in the current folder, use:

tar -xf archive.tar

the x option stands for extract
and to extract them to a specific directory, use:

tar -xf archive.tar -C directory

You can also just list the files contained in an archive:

![image](https://github.com/CageNic/video2audio/blob/master/admin_work/tar.png)

tar is often used to create a compressed archive, gzipping the archive.
This is done using the z option:

tar -czf archive.tar.gz file1 file2

This is just like creating a tar archive, and then running gzip on it.
To unarchive a gzipped archive, you can use gunzip , or gzip -d , and then
unarchive it, but tar -xf will recognize it's a gzipped archive, and do it for
you:

tar -xf archive.tar.gz
