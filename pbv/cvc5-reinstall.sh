#!/bin/sh
rm -rf build
cd ..
rm -rf build
cd deps/cvc5/build
make
cd ../../../
./configure.sh --cvc5 --smtlib-reader --debug --prefix=build/install --static
cd build
make -j7
make install -j7
cd ../pbv
mkdir build
cd build
cmake ..
make