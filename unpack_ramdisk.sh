WORKING_DIR="pwd"
export BIN=$($WORKING_DIR)"/bin"
export SOURCE_IMG=$($WORKING_DIR)"/kernel_image"
export UNPACK_TEMP=$($WORKING_DIR)"/temp"
export RAMDISK_EXTRACTED=$($WORKING_DIR)"/extracted/ramdisk"

$BIN/unpackbootimg -i $SOURCE_IMG/boot.img -o $UNPACK_TEMP

cd $RAMDISK_EXTRACTED
rm -r * > /dev/null 2>&1
gzip -dc $UNPACK_TEMP/boot.img-ramdisk.gz | cpio -i > /dev/null 2>&1  ##gzip
xz -dc $UNPACK_TEMP/boot.img-ramdisk.gz | cpio -i   > /dev/null 2>&1  ##lzma

