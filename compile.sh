WORKING_DIR="pwd"
export SOURCE=$($WORKING_DIR)"/source/common/"
export BIN=$($WORKING_DIR)"/bin"
export SOURCE_IMG=$($WORKING_DIR)"/Kernel"
export UNPACK_TEMP=$($WORKING_DIR)"/temp"
export RAMDISK_EXTRACTED=$($WORKING_DIR)"/extracted/ramdisk"
export OUTPUT=$($WORKING_DIR)"/output"
export UTIL=$($WORKING_DIR)"/utilities"
export TOOLCHAIN=$($WORKING_DIR)"/arm-toolchain/bin/arm-none-eabi-"

./clean.sh
cd $SOURCE

if [ "$1" == "-clean" ];
then
make clean
fi
make bcm21553_totoro_05_defconfig
make CONFIG_DEBUG_SECTION_MISMATCH=y $CPU_CORES EXTRA_AFLAGS='-mfpu=neon -ftree-vectorize -mfloat-abi=softfp'
echo "compile done"
sleep 1s &
wait
cp $SOURCE/arch/arm/boot/zImage $UNPACK_TEMP
cd $UTIL
./unpack_original_ramdisk.sh
cd ../
./pack_ramdisk.sh gzip


