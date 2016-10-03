#!/bin/bash
php5 resetter.php
cd sketch/
echo $(pwd)
ino clean
ino build
echo "Ino file has successfully compiled"
FILEHEX=".build/uno/firmware.hex"
FILEBIN=".build/uno/firmware.bin"
objcopy -I ihex ${FILEHEX} -O binary ${FILEBIN}
echo "bin file created successfully"

touch .build/uno/nextExecutor.sh
chmod 777 -f .build/uno/nextExecutor.sh

echo "#!/bin/bash 
tftp 192.168.88.88 69 <<END_SCRIPT 
mode octet
verbose
trace
put firmware.bin
quit
END_SCRIPT
exit 0" >.build/uno/nextExecutor.sh
cd .build/uno/
echo $(pwd)
sh nextExecutor.sh
