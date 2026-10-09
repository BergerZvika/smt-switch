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

## Input Logics
pbvsolver reads two encodings of parametric bit-vector formulas:

* `(set-logic ALL)`: bit-vector sorts carry their width term, e.g.
  `(declare-const k Int) (declare-const x (_ BitVec k))`.
* `(set-logic PBV)`: the width-free sort `PBitVec`, the `pbv*` operators,
  `pconcat`, `(pextract t hi lo)` and `(pbvsize t)`.

A PBV-logic file is first rewritten into the ALL encoding (`pbv_parser.cpp`):
the width of every `PBitVec` is inferred from the terms that must have equal
width, and widths that nothing fixes become fresh Int constants `k`, `k1`, ...
Both encodings then go through the same translation to integers. To see the
ALL encoding of a PBV-logic file, run:
```
./pbvsolver --pbv-to-all <path to smt2 file>
```
