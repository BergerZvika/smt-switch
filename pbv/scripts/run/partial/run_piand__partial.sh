#!/bin/sh
SOLVERS_DIR=/home/cs/zviarib
TIME_LIMIT=4
BENCHMARK_SET=alive
WD_BASE=/home/cs/zviarib/alive

/home/cs/zviarib/submit-job.sh $SOLVERS_DIR/pbvsolver --solver-options "-p --cvc5-full-saturate" --benchmark-sets "$BENCHMARK_SET" --time-limit $TIME_LIMIT --working-dir "$WD_BASE/partial_full-saturate-quant_4"
