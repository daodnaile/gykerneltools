WORKING_DIR="pwd"
export BIN=$($WORKING_DIR)"/bin"
export SOURCE_IMG=$($WORKING_DIR)"/Kernel"
export UNPACK_TEMP=$($WORKING_DIR)"/temp"
export RAMDISK_EXTRACTED=$($WORKING_DIR)"/extracted/ramdisk"
export OUTPUT=$($WORKING_DIR)"/output"
export UTIL=$($WORKING_DIR)"/utilities"


cd $UTIL
./md5sum.sh
cd $UNPACK_TEMP
md5sum=$(less md5)
md5=$(echo ${md5sum} | sed -e 's/.\{15\}$//')

cd ../

WORKING_DIR="pwd"


$BIN/mkbootimg --kernel $UNPACK_TEMP/*zImage --ramdisk $UNPACK_TEMP/boot.img-ramdisk.gz --kernelMD5 $md5 -o $OUTPUT/boot.img --base `cat $UTIL/boot.img-base`

cd $OUTPUT
rm -Rf *.tar > /dev/null 2>&1
echo "making odin flashable pda with"
tar cvf PDA.tar boot.img
echo "-> done!"
echo ""
cp  boot.img $UTIL/update/system/
cd $UTIL/update
echo "making flashable update.zip"
zip -r ../update.zip *
rm $UTIL/update/system/boot.img
cp $UTIL/update.zip $OUTPUT
echo "-> done!"
echo "watch output folder"
