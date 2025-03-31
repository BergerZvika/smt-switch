(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvslt (bvand (int_to_pbv k 1) s) t) (bvslt (bvlshr s s) t)))
(check-sat)
(exit)