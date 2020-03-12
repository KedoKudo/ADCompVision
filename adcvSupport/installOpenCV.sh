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
    -D WITH_OPENMP=OFF \
    -D WITH_TBB=OFF    \
    -D WITH_IPP=OFF    \
    -D WITH_CUDA=OFF   \
    -D CMAKE_BUILD_TYPE=Release \
    -D BUILD_EXAMPLES=OFF \
    -D BUILD_DOCS=OFF \
    -D BUILD_PERF_TESTS=OFF \
    -D BUILD_TESTS=OFF \
    -D BUILD_UNIT_TESTS=OFF \
    -D CMAKE_INSTALL_PREFIX=../../os/$EPICS_ARCH \
    ..

make -j 8
make install
