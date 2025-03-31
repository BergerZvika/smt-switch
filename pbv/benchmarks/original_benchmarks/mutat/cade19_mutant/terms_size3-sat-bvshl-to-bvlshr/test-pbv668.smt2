(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvlshr (bvshl s s) t)) (int_to_pbv k 0)))
(check-sat)
(exit)