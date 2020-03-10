#!/usr/bin/env bash

#=============================================================================#
#									      #
#		FILE:							      #
#	       USAGE:							      #
#	 DESCRIPTION:							      #
#									      #
#									      #
#	     OPTIONS:							      #
#	       NOTES:							      #
#									      #
#	      AUTHOR: Chris Hatzis					      #
#	     CREATED:							      #
#	    REVISION:							      #
#									      #
#=============================================================================#

set -o nounset

subn=
exfile=
matchip='^([[:digit:]]{1,3}\.){3}' # ^([[:digit:]]{1,3}\.){3} to match ip subnet


# Define the help(usage function)
function usage() {

	cat <<EOF
		$(basename $0) options
			Usage: $(basename $0) <[options]>
			Options:
				-s	Define the subnet
				-h	Show this message


EOF
}

while getopts ":s:" args
do
	case "$args" in
		s)
			subn=$1
			;;
#		-f | --file )
#			shift
#			exfile=$1
#			;;
#		-h | --help )
#			printf "Apologies. No help right now.\n"
#			exit
#			;;
		* )
			exit
	esac
done

printf "the first argument is $1\n"

for ip in $(seq 1 254);
do
	ping -4 -c 1 -w 1 -i 0.2 "$subn"."$ip" | grep "64 bytes"  | cut --delimiter=" " --fields=4 | cut --delimiter=":" --fields=1
done
