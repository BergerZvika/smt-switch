#!/bin/sh
SOLVERS_DIR=/home/cs/zviarib
TIME_LIMIT=4
BENCHMARK_SET=new_alive_sat
WD_BASE=/home/cs/zviarib/new_alive_sat

/home/cs/zviarib/submit-job.sh $SOLVERS_DIR/pbvsolver --solver-options "" --benchmark-sets "$BENCHMARK_SET" --time-limit $TIME_LIMIT --working-dir "$WD_BASE/piand_4"
