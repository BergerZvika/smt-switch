#!/bin/sh
SOLVERS_DIR=/home/cs/zviarib
TIME_LIMIT=4
BENCHMARK_SET=validation
WD_BASE=/home/cs/zviarib/validation

/home/cs/zviarib/submit-job.sh $SOLVERS_DIR/bwind.sh --solver-options "$SOLVERS_DIR/cvc5" --benchmark-sets "$BENCHMARK_SET" --time-limit $TIME_LIMIT --working-dir "$WD_BASE/cade-19_4"
