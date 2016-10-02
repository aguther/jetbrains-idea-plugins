#!/usr/bin/env bash

# get directories in current directory
for directory in $(find . -maxdepth 1 -mindepth 1 -type d | sort)
do
	# get basename from directory
	directory=$(basename "${directory}")

	# test if we are trying to process .git directory
	if [ "${directory}" == ".git" ]; then
		continue
	fi

	# inform user about current status
	echo
	echo -------------------------------------------------------------------------------
	echo Processing \'${directory}\' ...
	echo -------------------------------------------------------------------------------
	echo

	# change into directory
	pushd "${directory}" 1>/dev/null 2>&1

	# echo current dir
	eval "$@"

	# restore
	popd 1>/dev/null 2>&1
done