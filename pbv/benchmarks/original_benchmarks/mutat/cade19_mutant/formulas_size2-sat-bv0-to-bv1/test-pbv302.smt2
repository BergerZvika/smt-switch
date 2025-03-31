(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsle (bvmul s (int_to_pbv k 1)) t) (bvsle (bvlshr s s) t)))
(check-sat)
(exit)