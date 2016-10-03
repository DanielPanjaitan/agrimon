#!/bin/bash 
tftp 192.168.88.88 69 <<END_SCRIPT 
mode octet
verbose
trace
put firmware.bin
quit
END_SCRIPT
exit 0
