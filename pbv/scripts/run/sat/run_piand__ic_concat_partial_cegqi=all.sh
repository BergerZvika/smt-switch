#!/bin/sh
SOLVERS_DIR=/home/cs/zviarib
TIME_LIMIT=4
BENCHMARK_SET=ic_concat_sat
WD_BASE=/home/cs/zviarib/ic_concat_sat

/home/cs/zviarib/submit-job.sh $SOLVERS_DIR/pbvsolver --solver-options "-p" --benchmark-sets "$BENCHMARK_SET" --time-limit $TIME_LIMIT --working-dir "$WD_BASE/partial_4"
