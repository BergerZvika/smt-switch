(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsle (bvlshr (int_to_pbv k 1) s) s) (bvsle (int_to_pbv k 0) s)))
(check-sat)
(exit)