#!/bin/sh
SOLVERS_DIR=/home/cs/zviarib
TIME_LIMIT=4
BENCHMARK_SET=rewrite_bvand
WD_BASE=/home/cs/zviarib/rewrite_bvand

/home/cs/zviarib/submit-job.sh $SOLVERS_DIR/pbvsolver --solver-options "-p --cvc5-cegqi-all" --benchmark-sets "$BENCHMARK_SET" --time-limit $TIME_LIMIT --working-dir "$WD_BASE/partial_cegqi-all_4"
