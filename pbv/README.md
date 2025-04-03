# pbvsolver
pbvsolver extends SMT-Switch to support the PBV theory.

# Quick Start
This section provides instructions for downloading and installing pbvsolver.

## Install pbvsolver Using Docker
To use pbvsolver with docker, go to the directory
to which this README.md file belongs (directory `pbv` under the
main directory of the repository).

```
 git clone https://github.com/BergerZvika/smt-switch.git
 cd smt-switch/pbv
 docker build -t pbvsolver-binary .
 docker run -it --rm pbvsolver-binary
 ./pbvsolver <path to smt2 file>
```
For an example, you can run:
```
./pbvsolver ../benchmarks/validation/test-pbvmul-unsat.smt2
  ```
## Downloading the Dockerfile Without Cloning the Repository

You can download the Dockerfile separately without cloning the entire `smt-switch` repository using:

 ```
wget 'https://raw.githubusercontent.com/BergerZvika/smt-switch/pbv-master/pbv/Dockerfile' -O Dockerfile
```
## Install pbvsolver binary Without Docker
```
 git clone -b pbv-master https://github.com/BergerZvika/smt-switch.git
 cd smt-switch/pbv
 bash install.sh
 cd build
 ./pbvsolver <path to smt2 file>
```
For an example, you can run:
```
./pbvsolver ../benchmarks/validation/test-pbvmul-unsat.smt2
  ```
