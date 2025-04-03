FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

# install dependencies
RUN apt-get update && apt-get install -y \
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

RUN /usr/bin/python3 -m pip install toml

# Set the working directory inside the container
WORKDIR /app

# Clone the smt-switch repository
RUN git clone -b pbv-master https://github.com/BergerZvika/smt-switch.git

# install smt-switch dependencies
WORKDIR /app/smt-switch
RUN ./contrib/setup-bison.sh
RUN ./contrib/setup-flex.sh

# install cvc5 with pow2 and piand solvers
WORKDIR /app/smt-switch/deps
RUN git clone https://github.com/BergerZvika/cvc5.git
RUN chmod -R 777 cvc5
WORKDIR /app/smt-switch/deps/cvc5
RUN git checkout -f pbv-cvc5
RUN ./configure.sh --static --auto-download
WORKDIR /app/smt-switch/deps/cvc5/build
RUN make -j8

# install pbvsolver
WORKDIR /app/smt-switch
RUN ./configure.sh --cvc5 --smtlib-reader --debug --prefix=build/install --static
WORKDIR /app/smt-switch/build
RUN make
RUN make install
WORKDIR /app/smt-switch/pbv
RUN mkdir build
WORKDIR /app/smt-switch/pbv/build
RUN cmake ..
RUN make

# Set the working directory where the static binary exist
WORKDIR /app/smt-switch/pbv/build

# Command to run the built program (change this as needed)
ENTRYPOINT ["/bin/bash"]
