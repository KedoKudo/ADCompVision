#!/bin/bash

# Set version and architecture
EPICS_ARCH=linux-x86_64
OPENCV_VERSION=3.2.0


git clone https://github.com/opencv/opencv
mkdir os
mkdir os/$EPICS_ARCH
cd opencv
git checkout -q $OPENCV_VERSION
mkdir build
cd build
# Remove the Install prefix flag to install to /usr/local/lib
cmake  \
    -D WITH_CUDA=OFF   \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=../../os/$EPICS_ARCH \
    ..

make -j 8
make install
