(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult (bvmul s (int_to_pbv k 1)) t) (bvult (bvlshr s s) t)))
(check-sat)
(exit)