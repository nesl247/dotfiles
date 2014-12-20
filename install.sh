#!/bin/sh

for x in confs/*;
do
	file=$(basename $x)
	source=${PWD}/confs/${file}
	target=${HOME}/.${file}
	
	if ! test -L $target; then
		ln -s ${source} ${target}
	elif test -f $target; then
		echo "${target} already exists. It must be removed and then re-run this installer"
	fi
done

for x in installers/*;
do
	if test -x $x; then
		${x}
	else
		echo "$(basename ${x}) is not executable"
	fi
done
