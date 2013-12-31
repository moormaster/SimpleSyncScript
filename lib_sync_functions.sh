#!/bin/bash

backup()
{
	backupdir=_rsync_backup
	now=$(date +%Y_%m_%d_%H_%M)

	mkdir $2/$backupdir

	rsync -abv --exclude=$backupdir --backup-dir=$backupdir/$now --delete $1 $2

	rmdir --ignore-fail-on-non-empty $2/$backupdir
}
