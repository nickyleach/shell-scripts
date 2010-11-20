#! /bin/bash
# process_queue.sh
# Author: Nicky Leach
# Date: November 20, 2010

# queue_file will contain newline terminated strings where each line should be a command executable in the shell
# example - echo "hi"
queue_file='/path/to/queue/file';

num_queued_items(){
	echo `cat $queue_file | wc -l`
}

pop_item(){
	local code=`head $queue_file -n 1`
	sed -i '1d' $queue_file
	
	echo $code
}

while [ $(num_queued_items) -ge 1 ]
do
	code=$(pop_item);
	echo $code;
	eval $code;
done
