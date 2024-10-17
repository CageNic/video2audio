# Use mktemp to create a temporary file. The utility returns the full path of the created file.

temp_file=$(mktemp)
# Or, to create a temporary directory:

temp_dir=$(mktemp -d)
# you may want to delete the temporary file or directory:

rm "${temp_file}"
rm -r "${temp_dir}"

#### script ####

# create temporary file
tmpfile=$(mktemp /tmp/abc-script.XXXXXX)

# create file descriptor 3 for writing to a temporary file so that
# echo ... >&3 writes to that file
exec 3>"$tmpfile"

# create file descriptor 4 for reading from the same file so that
# the file seek positions for reading and writing can be different
exec 4<"$tmpfile"

# delete temp file; the directory entry is deleted at once; the reference counter
# of the inode is decremented only after the file descriptor has been closed.
# The file content blocks are deallocated (this is the real deletion) when the
# reference counter drops to zero.
rm "$tmpfile"

# your script continues
: ...

# example of writing to file descriptor
echo foo >&3

# your script continues
: ...

# reading from that file descriptor
head -n 1 <&4

# close the file descriptor (done automatically when script exits)
# see section 2.7.6 of the POSIX definition of the Shell Command Language
exec 3>&-
