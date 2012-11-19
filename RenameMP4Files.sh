#!/bin/zsh

# hacked by Bjoern Stierand
# feel free to use as you like

# a simple script to extract MP4 metadata from files
# and rename them according to the iTunes naming conventions
# (i.e. "<#> <Episodename>.mp4")

# Make sure AtomicParsley binary is available
AP_BINARY=`which AtomicParsley`
[ $? -ne 0 ] && 
	AP_BINARY='/usr/local/bin/atomicparsley/AtomicParsley'

[ -x "$AP_BINARY" ] || {
	echo "AtomicParsley binary couldn't be found."
	echo "Get it from http://atomicparsley.sourceforge.net/"
}

# Check if any input parameters were provided
[ $# -eq 0 ] && {
	echo "No files provided as parameter"
	exit 1
}

# Process all input parameters as files
for FILE in $@; do
	# check if files are really there
	[ -r $FILE ] && {
		DNAME=`dirname $FILE`

		# get metadata using AtomicParsley
		# strip of leading "Atom 'xxxx' contains" text to get
		# value of the atom
		# use cut to strip so the title can still contain 
		EP_NAME=`$AP_BINARY $FILE -t | grep ©nam | cut -d : -f 2- | \
			sed "s|^ ||g"`
		EP_NUMBER=`$AP_BINARY $FILE -t | grep trkn | cut -d : -f 2- | \
			sed "s|^ ||g"`
		
		[ "$EP_NUMBER" -lt 10 ] && EP_NUMBER="0${EP_NUMBER}"

		# move files
		NEW_FILENAME="${DNAME}/${EP_NUMBER} ${EP_NAME}.mp4"
		mv "$FILE" "$NEW_FILENAME"
	}
done