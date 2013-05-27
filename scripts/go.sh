#Change directories to suit. 
#This example assumes downloaded files in /opt/incoming, build under /opt/build, target under /home/root/apps/otp.
#I'm using a USB stick formatted ext2 and mounted at /opt, using the following fstab entry. You'll need to use your UUID.
#	UUID=08289e70-8a9c-4cd6-9d13-9e90ad02c930 /opt/ auto defaults 0 0
#
#ODBC is disabled since I don't have any DB drivers installed, and didn't want to fiddle with it.

INCOMING_DIR=/opt/incoming
BUILD_DIR=/opt/build
TARGET_DIR=/home/root/apps/otp

mkdir -p ${BUILD_DIR}

echo "Build flex"
cd ${BUILD_DIR}
tar xzf ${INCOMING_DIR}/flex-2.5.37.tar.gz
cd ${BUILD_DIR}/flex-2.5.37
./configure
make install

echo "Build OTP"
cd ${BUILD_DIR}
tar xzf ${INCOMING_DIR}/otp_src_R16B.tar.gz
cd ${BUILD_DIR}/otp_src_R16B

./configure --prefix ${TARGET_DIR} --without-odbc
make install
