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

version=1.0
subn=
exfile=
matchip='^([[:digit:]]{1,3}\.){3}' # ^([[:digit:]]{1,3}\.){3} to match ip subnet

function mysweeper() {
	
	for ip in $(seq 1 254)
	do
		ping -4 -c 1 -w 1 -i 0.2 "$1""$ip" | grep "64 bytes"  | \
		cut --delimiter=" " --fields=4 | cut --delimiter=":" --fields=1
	done

}

function myversion() {
	printf "$(basename $0 | cut --delimiter="." --fields=1) 1.0\n"
}

# Define the help(usage function)
function usage() {

	cat <<EOF
		$(basename $0) options
			Usage: $(basename $0) <[options]>
			Options:
				-s	Define the subnet
				-h	Show this message
				-V	Show version and exit

EOF
}

while getopts ":s:h:V" args
do
	case "$args" in
		s)
			subn=${OPTARG}
			;;
#		-f | --file )
#			;;
		V)
			myversion
			exit
			;;
		h | *)
			usage
			exit
			;;
	esac
done

mysweeper $subn
#printf "the first argument is $1\n"
