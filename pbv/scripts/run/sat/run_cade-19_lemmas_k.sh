#!/bin/sh
SOLVERS_DIR=/home/cs/zviarib
TIME_LIMIT=4
BENCHMARK_SET=lemmas_k_sat
WD_BASE=/home/cs/zviarib/lemmas_k_sat

/home/cs/zviarib/submit-job.sh $SOLVERS_DIR/bwind.sh --solver-options "$SOLVERS_DIR/cvc5" --benchmark-sets "$BENCHMARK_SET" --time-limit $TIME_LIMIT --working-dir "$WD_BASE/cade-19_4"
