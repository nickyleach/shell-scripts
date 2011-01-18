#! /bin/bash
# check_queue_size.sh
# Author: Nicky Leach
# Date: January 18, 2011

# Arguments:
# $1 - Path to the queue file
# $2 - (Optional) String to grep the queue for

if [ $# -ge 1 ]
then
	# queue_file will contain newline terminated strings where each line should be a command executable in the shell
	# example - echo "hi"
	queue_file=$1
else
	echo "$0 : Please enter the path to the queue file"
	exit 1;
fi

if [ $# -ge 2 ]
then
	echo `cat ${queue_file} | grep ${2} | wc -l`
else
	echo `cat ${queue_file} | sed '/^\s*$/d' | wc -l`
fi