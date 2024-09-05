#!/bin/sh
SOLVERS_DIR=/home/cs/zviarib
TIME_LIMIT=4
BENCHMARK_SET=new_alive
WD_BASE=/home/cs/zviarib/new_alive

/home/cs/zviarib/submit-job.sh $SOLVERS_DIR/pbvsolver --solver-options "-c --cvc5-cegqi-full" --benchmark-sets "$BENCHMARK_SET" --time-limit $TIME_LIMIT --working-dir "$WD_BASE/combine_cegqi-full_4"
