#! /bin/bash
# run_in_screen.sh
# Author: Nicky Leach
# Date: January 16, 2011

# Arguments:
# $1 - Name of the screen
# $2 - Fully qualified path of the script to be run
# $3 [, $4, $5...] All additional params passed to the script provided

args_push() {
  args=("${args[@]}" "$1")
}

function args_unshift() {
	placeholder=${args[0]}
	unset args[0]
	arr=("${args[@]}")
}

# Store the arguments in the $arr array
args=()
for i; do args_push "$i"; done

if [ $# -ge 1 ]
then
	SCREENNAME=$1
	args_unshift
else
	echo "$0 : Please enter the name of the screen you'd like create"
	exit 1;
fi

if [ $# -ge 2 ]
then
	SCRIPTPATH=$2
	args_unshift
else
	echo "$0 : Please enter the full path of the script you'd like to run"
	exit 1;
fi

screen -dmS $SCREENNAME bash -c "${2} ${args[@]}" > /dev/null 2>&1