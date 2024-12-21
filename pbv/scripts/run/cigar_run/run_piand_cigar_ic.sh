#!/bin/sh
SOLVERS_DIR=/home/cs/zviarib
TIME_LIMIT=4
BENCHMARK_SET=ic
WD_BASE=/home/cs/zviarib/ic

/home/cs/zviarib/submit-job.sh $SOLVERS_DIR/pbvsolver --solver-options "--cigar" --benchmark-sets "$BENCHMARK_SET" --time-limit $TIME_LIMIT --working-dir "$WD_BASE/piand_cigar_4"
