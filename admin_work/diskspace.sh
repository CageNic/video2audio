# run every 12 hours on cron
# 0	*/6 *		*		* /path/to/script/diskspace.sh

#!/bin/bash
filesystems=("/" "/apps" "/database")
for i in ${filesystems[@]}; do
usage=$(df -h $i | tail -n 1 | awk '{print $5}' | cut -d % -f1)
if [ $usage -ge 90 ]; then
alert="Running out of space on $i, Usage is: $usage%"
echo "Sending out a disk space alert email."
echo $alert | mail -s "$i is $usage% full" your_email
fi
done
