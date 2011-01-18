Just a collection of random shell scripts, most of which probably won't be useful for anyone but me.

---

* __process_queue__ - Very simple collection of scripts for processing a fifo queue
	* process\_queue.sh - Script to chew through the fifo queue
	* check\_queue\_size.sh - Wrapper script around `wc` and `grep`
* __ecoutify_itunes__ - Ensure iTunes and Ecoute play nicely together when the keyboard controls are involved
	* ecoutify\_itunes.sh - Script to backup and modify iTunes.app
	* iTunes.py - Python script which will delegate to the original iTunes application when Ecoute is not running