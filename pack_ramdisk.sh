WORKING_DIR="pwd"
export BIN=$($WORKING_DIR)"/bin"
export SOURCE_IMG=$($WORKING_DIR)"/Kernel"
export UNPACK_TEMP=$($WORKING_DIR)"/temp"
export RAMDISK_EXTRACTED=$($WORKING_DIR)"/extracted/ramdisk"
export OUTPUT=$($WORKING_DIR)"/output"
export UTIL=$($WORKING_DIR)"/utilities"



cd $UNPACK_TEMP
chmod 777 *
rm boot.img-ramdisk.gz > /dev/null 2>&1

if [ "$1" == "lzma" ];
	then
        	$BIN/mkbootfs $RAMDISK_EXTRACTED | lzma > $UNPACK_TEMP/boot.img-ramdisk.gz

elif [ "$1" == "gzip" ];
	then
        	$BIN/mkbootfs $RAMDISK_EXTRACTED | gzip > $UNPACK_TEMP/boot.img-ramdisk.gz
fi




