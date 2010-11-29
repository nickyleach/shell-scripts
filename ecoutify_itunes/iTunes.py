#!/usr/bin/env python

import sys, os, subprocess

launch = True
blocker = ""

apps = ["Ecoute.app"]

ps = subprocess.Popen("/bin/ps -x", shell=True, stdout=subprocess.PIPE)

for line in ps.stdout.read().split("\n"):
	for app in apps:
		if app in line:
			launch = False
			blocker = app

ps.stdout.close()

if launch :
	os.spawnvp(os.P_WAIT, '/Applications/iTunes.app/Contents/MacOS/iTunesX', sys.argv)
else :
	print "Not launching iTunes while %s is running." % blocker 
