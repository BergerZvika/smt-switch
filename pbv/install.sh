#!/bin/sh
cd ..
./contrib/setup-bison.sh
./contrib/setup-flex.sh
./contrib/setup-cvc5.sh
./configure.sh --cvc5 --smtlib-reader --debug --prefix=build/install --static
cd build
make
make install
cd ../pbv
mkdir build
cd build
cmake ..
make