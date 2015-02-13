#!/bin/sh
#遍历当前的一级目录，监听他们
for line in `find * -maxdepth 0 -type d`; do 
    nohup ./codersyn.sh $line > /dev/null &
done

