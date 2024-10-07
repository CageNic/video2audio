find -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 --all-repeated=separate

let's go though that step by step.

find -not -empty -type f
Find all non-empty files in the current directory or any of its subdirectories.

   -printf "%s\n"
Print its size. If you drop these arguments, it will print paths instead, breaking subsequent steps.

 | sort -rn
Sort numerically (-n), in reverse order (-r). Sorting in ascending order and comparing as strings not numbers should work just as well, though, so you may drop the -rn flags.

 | uniq -d
Look for duplicate consecutive rows and keep only those.

 | xargs -I{} -n1
For each line of input (i.e. each size that occurs more than once), execute the following command, but replace {} by the size. Execute the command once for each line of input, as opposed to passing multiple inputs to a single invocation.

   find -type f -size {}c -print0
This is the command to run for each size: Find files in the current directory which match that size, given in characters (c) or more precisely bytes. Print all the matching file names, separated by null bytes instead of newlines so filenames which contain newlines are treated correctly.

 | xargs -0 md5sum
For each of these null-separated names, compute the MD5 checksum of said file. This time we allow passing multiple files to a single invocation of md5sum.

 | sort
Sort by checksums, since uniq only considers consecutive lines.

 | uniq -w32 --all-repeated=separate
Find lines which agree in their first 32 bytes (the checksum; after that comes the file name). Print all members of such runs of duplicates, with distinct runs separated by newlines.

Compared to the simpler command suggested by heemayl, this has the benefit that it will only checksum files which have another file of the same size. It pays for that with repeated find invocations, thus traversing the directory tree multiple times. For those reasons, this command is particularly well-suited for directories with few but big files, since in those cases avoiding a checksum call may be more important than avoiding repeated tree traversal.
