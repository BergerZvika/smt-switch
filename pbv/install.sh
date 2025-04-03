#!/bin/sh

# install dependencies
apt-get update && apt-get install -y \
  build-essential \
  git \
  python3 \
  python3-pip \
  openjdk-17-jdk \
  cmake \
  libc6-dev \
  libgmp-dev \
  clang \
  curl \
  bison \ 
  flex \
  g++ \
  gcc \
  m4

/usr/bin/python3 -m pip install toml

# install smt-switch dependencies
cd ..
./contrib/setup-bison.sh
./contrib/setup-flex.sh

# install cvc5 with pow2 and piand solvers

./contrib/setup-cvc5.sh
# install pbvsolver
./configure.sh --cvc5 --smtlib-reader --debug --prefix=build/install --static
cd build
make
make install
cd ../pbv
mkdir build
cd build
cmake ..
make