(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvlshr (bvnot (int_to_pbv k 0)) t)) (bvlshr (bvshl s t) t)))
(check-sat)
(exit)