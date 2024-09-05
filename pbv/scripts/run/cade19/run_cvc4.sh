#!/bin/sh
SOLVERS_DIR=/home/cs/zviarib
TIME_LIMIT=300
BENCHMARK_SET=alive
WD_BASE=/home/cs/zviarib/cade19

/home/cs/zviarib/submit-job.sh $SOLVERS_DIR/bwind.sh --solver-options "$SOLVERS_DIR/cvc4 '--nl-ext-tplanes'" --benchmark-sets "$BENCHMARK_SET" --time-limit $TIME_LIMIT --working-dir "$WD_BASE/cvc4_300"