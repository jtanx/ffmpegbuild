#!/bin/bash
set -eo pipefail

echo $PATH
cd FFmpeg

wget http://www.tortall.net/projects/yasm/releases/yasm-1.3.0-win64.exe -O /bin/yasm.exe

./configure \
  --arch=amd64 \
  --cpu=amd64 \
  --enable-gpl \
  --enable-nonfree \
  --enable-network \
  --enable-static \
  --disable-debug \
  --disable-doc \
  --disable-devices \
  --enable-hwaccels \
  --enable-w32threads \
  --enable-x86asm \
  --enable-zlib \
  --enable-libfdk-aac\
  --prefix=install \
  --toolchain=msvc

make
make install
# rename lib "" install/lib/*.a
# rename .a .lib install/lib/*.a
mv install/bin/*.lib install/lib/