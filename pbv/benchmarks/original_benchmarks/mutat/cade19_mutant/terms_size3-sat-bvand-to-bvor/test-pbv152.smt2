(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvor s t) t) (int_to_pbv k 0)))
(check-sat)
(exit)