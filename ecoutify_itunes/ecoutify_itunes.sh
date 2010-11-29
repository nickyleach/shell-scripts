#! /bin/bash
# ecoutify_itunes.sh
# Author: Nicky Leach
# Date: November 29, 2010
# Credit: http://mdbraber.com/2009/10/21/stop-itunes-from-launching-when-pressing-the-playpause-button-on-your-keyboard-snow-leopard/

printf "$0 - Disables iTunes from starting while Ecoute is running\n\n"

if [ `id -u` -ne 0 ]
then
    echo "Must be root. Please run the script again with \"sudo $0\""
    exit 1
fi

if [ -f iTunes.py ]
then
	printf "Found iTunes.py...\n"
else
	echo "Could not find iTunes.py in the current directory. Exiting..."
	exit 1
fi

pyOut=`python -c "import py_compile,sys;sys.stderr=sys.stdout;py_compile.compile(r'/Applications/iTunes.app/Contents/MacOS/iTunes')"`;
if [ ${#pyOut} -ne 0 ]
then
	printf "Removing backup...\n"
	sudo rm -f /Applications/iTunes.app/Contents/MacOS/iTunesX
	
	printf "Creating iTunes backup...\n"
	sudo mv /Applications/iTunes.app/Contents/MacOS/iTunes /Applications/iTunes.app/Contents/MacOS/iTunesX
else
	printf "iTunes already ecoutified. Updating...\n"
fi

sudo rm -f /Applications/iTunes.app/Contents/MacOS/iTunesc

printf "Replacing iTunes binary with iTunes.py...\n"
sudo cp iTunes.py /Applications/iTunes.app/Contents/MacOS/iTunes

printf "Changing permissions for iTunes...\n"
sudo chown root:admin /Applications/iTunes.app/Contents/MacOS/iTunes
sudo chmod 0755 /Applications/iTunes.app/Contents/MacOS/iTunes

printf "\nComplete!\n\n"