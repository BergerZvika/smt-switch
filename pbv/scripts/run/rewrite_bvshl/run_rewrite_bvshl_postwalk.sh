#!/bin/sh
SOLVERS_DIR=/home/cs/zviarib
TIME_LIMIT=4
BENCHMARK_SET=rewrite_bvshl
WD_BASE=/home/cs/zviarib/rewrite_bvshl

/home/cs/zviarib/submit-job.sh $SOLVERS_DIR/pbvsolver --solver-options "" --benchmark-sets "$BENCHMARK_SET" --time-limit $TIME_LIMIT --working-dir "$WD_BASE/postwalk_rewrite_bvshl_4"
