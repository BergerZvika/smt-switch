(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvshl (bvnot (int_to_pbv k 0)) t)) (bvshl (bvlshr s t) t)))
(check-sat)
(exit)