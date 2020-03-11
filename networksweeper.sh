#!/usr/bin/env bash

#=============================================================================#
#									      #
#		FILE: ./networksweeper.sh				      #
#	       USAGE: networksweeper [options] subnet (f.e 192.168.0.)	      #
#	 DESCRIPTION: A fast ping network sweeper to scan a network for       #
#		      live hosts					      #
#									      #
#									      #
#	     OPTIONS: -s [subnet] -h [help] -V [version]		      #
#	       NOTES: This is my first attempt to publish one of my tools     #
#									      #
#	      AUTHOR: Chris Hatzis					      #
#	     CREATED: 10 March 2020					      #
#	    REVISION:							      #
#									      #
#=============================================================================#

set -o nounset
subn=
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

for o in $@
do
	if [[ $o =~ $matchip ]]
	then
 		subn=$o
 	fi
done

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
