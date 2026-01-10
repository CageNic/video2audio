# call an external script based on environment time
# RUNAT can be edited to include dates


#!/bin/bash

RUNAT="13:49"

while [ 1 ]
do
    DATE=`/bin/date +%H:%M`
    if [ $DATE. = $RUNAT. ]
    then
    	echo $DATE
        python3 crawl_ER.py
    fi

    sleep 60
done
