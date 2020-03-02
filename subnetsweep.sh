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

user_args=
subn=
exfile=

while getopts "s:subnet:" args
do
	case "$args" in
		-s | --subnet )
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
