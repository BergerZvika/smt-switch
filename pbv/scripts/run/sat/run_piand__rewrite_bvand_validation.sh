#!/bin/sh
SOLVERS_DIR=/home/cs/zviarib
TIME_LIMIT=4
BENCHMARK_SET=rewrite_bvand_validation_sat
WD_BASE=/home/cs/zviarib/rewrite_bvand_validation_sat

/home/cs/zviarib/submit-job.sh $SOLVERS_DIR/pbvsolver --solver-options "" --benchmark-sets "$BENCHMARK_SET" --time-limit $TIME_LIMIT --working-dir "$WD_BASE/piand_4"
