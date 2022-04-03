#!/bin/bash

mapFirstResolveableHostname() {
	hostnames=( "$@" )

	for (( i=0; i<${#hostnames[@]}; i++ ))
	do
		tokens=( ${hostnames[$i]/:/ } )
		hostname="${tokens[0]}"
		mapped="${tokens[1]}"

		if [ "$mapped" == "" ]
		then
			mapped="$hostname"
		fi

		if ping -c 3 $hostname > /dev/null
		then
			echo $mapped
			return
		fi
	done

	echo $mapped
}

backup()
{
	backupdir=_rsync_backup
	now=$(date +%Y_%m_%d_%H_%M)

	rsyncsource=$1
	rsynctarget=$2

	mkdir ${rsynctarget}/${backupdir}
	rsync -abv --exclude=${backupdir} --backup-dir=${backupdir}/${now} --delete ${rsyncsource} ${rsynctarget}
	rmdir --ignore-fail-on-non-empty ${rsynctarget}/${backupdir}/${now}
	rmdir --ignore-fail-on-non-empty ${rsynctarget}/${backupdir}
}
