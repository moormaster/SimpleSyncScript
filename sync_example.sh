#!/bin/bash

SCRIPTDIR="$( dirname "$( readlink -f "$0" )" )"
. "$SCRIPTDIR/lib_sync_functions.sh"

backup /home/user/MyDocuments/ /media/USBDisc/MyDocuments/
backup /home/user/MyMusic/ /media/USBDisc/MyMusic/
