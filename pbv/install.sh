#!/bin/sh
cd ..
./contrib/setup-cvc5.sh
./configure.sh --cvc5 --smtlib-reader --debug --prefix=build/install
cd build
make
make install
cd ../pbv/build
cmake ..
make
cd ../..
LD_LIBRARY_PATH=/usr/local/bin:$(pwd)/build/install/lib 
export LD_LIBRARY_PATH
