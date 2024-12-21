#!/bin/sh
SOLVERS_DIR=/home/cs/zviarib
TIME_LIMIT=4
BENCHMARK_SET=ic_concat
WD_BASE=/home/cs/zviarib/ic_concat

/home/cs/zviarib/submit-job.sh $SOLVERS_DIR/pbvsolver --solver-options "--sum-ge-lemma" --benchmark-sets "$BENCHMARK_SET" --time-limit $TIME_LIMIT --working-dir "$WD_BASE/piand_sum_ge_4"
