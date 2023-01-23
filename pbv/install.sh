#!/bin/sh
cd ..
./configure.sh --cvc5 --smtlib-reader --debug --prefix=build/install
cd build
make
make install
cd ../pbv/build
cmake ..
make
cd ../..
echo -n "#!/bin/sh
LD_LIBRARY_PATH=/usr/local/bin:$(pwd)/build/install/lib 
export LD_LIBRARY_PATH"  >> temp.sh
bash temp.sh
rm temp.sh
cd pbv/build