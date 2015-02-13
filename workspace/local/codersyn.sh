#!/bin/sh
DIR=$1
PREFIX=luofei_
fswatch -0 $DIR |  while read -d "" i ; do \
    date +%H:%M:%S && /usr/bin/rsync -iru   --delete -e 'ssh -i ./rsync-key -p 22' $DIR www-data@103.227.76.203:/code/$PREFIX$DIR
done
