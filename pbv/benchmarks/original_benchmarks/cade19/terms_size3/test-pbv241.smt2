(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr s (bvnot (bvmul t t))) (int_to_pbv k 0)))
(assert (> k 4))
(check-sat)
(exit)