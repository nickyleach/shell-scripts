#! /bin/bash
# process_queue.sh
# Author: Nicky Leach
# Date: November 20, 2010

# Arguments:
# $1 - Path to the queue file
# $2 - (Optional) Number of seconds to wait to see if new items have been added to the queue - causes the process to run in a loop

if [ $# -ge 1 ]
then
	# queue_file will contain newline terminated strings where each line should be a command executable in the shell
	# example - echo "hi"
	queue_file=$1
else
	echo "$0 : Please enter the path to the queue file"
	exit 1;
fi

num_queued_items(){
	echo `cat $queue_file | wc -l`
}

pop_item(){
	local code=`head -n 1 $queue_file`
	sed -i -e '1d' $queue_file
	
	echo $code
}

process_queue(){
	while [ $(num_queued_items) -ge 1 ]
	do
		code=$(pop_item);
		echo $code;
		eval $code;
	done
}

while [ 1 ]
do
	$(process_queue);
	if [ $# -ge 2 ]
	then
		sleep $2s;
	else
		break;
	fi
done;