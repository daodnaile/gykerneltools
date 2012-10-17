WORKING_DIR="pwd"
export FILE=$($WORKING_DIR)"/original_boot.img-ramdisk.gz"
export RAMDISK_EXTRACTED="../extracted/ramdisk"
cd $RAMDISK_EXTRACTED
gzip -dc $FILE | cpio -i > /dev/null 2>&1  ##gzip
