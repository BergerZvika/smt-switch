## Use pbvsolver with Dockerfile

To use pbvsolver with docker, go to the directory
to which this README.md file belongs (directory `pbv` under the
main directory of the repository).

Then run:
```
$ docker build -t pbvsolver .
```
This will take several minutes.

Then, to run pbvsolver, do the following:
```
$ docker run pbvsolver <path to smt2 file>
```

For an example, you can run:
```
docker run pbvsolver benchmarks/validation/test-pbvmul-unsat.smt2
```
