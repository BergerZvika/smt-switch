(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvlshr s (bvnot (int_to_pbv k 0))) (int_to_pbv k 0))))
(check-sat)
(exit)