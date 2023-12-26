#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
DEPS=$DIR/../deps

mkdir -p $DEPS

# CVC5_VERSION=7c97295f7480b9feca25c14b90b76ee1c04e8877
CVC5_VERSION=f77d169151ad14865eb030ad39d5f2c3d6192502

if [ "$(uname)" == "Darwin" ]; then
    NUM_CORES=$(sysctl -n hw.logicalcpu)
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    NUM_CORES=$(nproc)
else
    NUM_CORES=1
fi

if [ ! -d "$DEPS/cvc5" ]; then
    cd $DEPS
    git clone https://github.com/BergerZvika/cvc5.git
    chmod -R 777 cvc5
    cd cvc5
    git checkout -f ${CVC5_VERSION}
    CXXFLAGS=-fPIC CFLAGS=-fPIC ./configure.sh --static --auto-download --tracing
    cd build
    make -j$NUM_CORES
    cd $DIR
else
    echo "$DEPS/cvc5 already exists. If you want to rebuild, please remove it manually."
fi

if [ -f $DEPS/cvc5/build/src/libcvc5.a ] && [ -f $DEPS/cvc5/build/src/parser/libcvc5parser.a ]; then
    echo "It appears cvc5 was setup successfully into $DEPS/cvc5."
    echo "You may now install it with make ./configure.sh --cvc5 && cd build && make"
else
    echo "Building cvc5 failed."
    echo "You might be missing some dependencies."
    echo "Please see their github page for installation instructions: https://github.com/cvc5/cvc5"
    exit 1
fi
