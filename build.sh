#!/bin/bash

echo $PATH
cd FFmpeg

./configure \
  --arch=amd64 \
  --cpu=amd64 \
  --enable-gpl \
  --enable-nonfree \
  --enable-network \
  --disable-shared \
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
  --toolchain=msvc ||  (ls && cat ffbuild/config.log && exit 1)



make -j4
make install