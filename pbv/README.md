# PBV-Solver 
PBV-Solver extends SMT-Switch to support the PBV theory, as described in:  `Bit-precise Reasoning with Parametric Bit-vectors`

# Quick Start
This section provides instructions for downloading and installing PBV-Solver.


## Install Pbv-Solver binary
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

## Install Pbv-Solver Using  Dockerfile


```
 cd smt-switch/pbv
 docker build -t pbvsolver .
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
