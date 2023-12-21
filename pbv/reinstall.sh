#!/bin/sh
rm -rf build
cd ../build
make -j7
make install -j7
cd ../pbv
mkdir build
cd build
cmake ..
make