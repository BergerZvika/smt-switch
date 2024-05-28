#!/bin/sh
SOLVERS_DIR=/home/cs/zviarib
TIME_LIMIT=4
BENCHMARK_SET=lemmas_k
WD_BASE=/home/cs/zviarib/lemmas_k

/home/cs/zviarib/submit-job.sh $SOLVERS_DIR/pbvsolver --solver-options "--no-sum-based-lemma" --benchmark-sets "$BENCHMARK_SET" --time-limit $TIME_LIMIT --working-dir "$WD_BASE/piand_no_sum_lemma_4"
