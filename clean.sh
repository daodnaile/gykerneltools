WORKING_DIR="pwd"
export BIN=$($WORKING_DIR)"/bin"
export SOURCE_IMG=$($WORKING_DIR)"/Kernel"
export UNPACK_TEMP=$($WORKING_DIR)"/temp"
export RAMDISK_EXTRACTED=$($WORKING_DIR)"/extracted/ramdisk"
export OUTPUT=$($WORKING_DIR)"/output"
export UTIL=$($WORKING_DIR)"/utilities"
export TOOLCHAIN=$($WORKING_DIR)"/arm-toolchain/bin/arm-none-eabi-"

cd $UNPACK_TEMP
echo "Cleaning temp"
rm -r * > /dev/null 2>&1
echo "done"
echo ""

cd $RAMDISK_EXTRACTED
echo "Cleaning extracted"
rm -r * > /dev/null 2>&1
echo "done"
echo ""
cd $OUTPUT
echo "Cleaning Output"
rm -r * > /dev/null 2>&1
echo "done"
echo ""
cd $UTIL
echo "Cleaning Utilities"
rm -r $UTIL/update.zip > /dev/null 2>&1
echo "done"

