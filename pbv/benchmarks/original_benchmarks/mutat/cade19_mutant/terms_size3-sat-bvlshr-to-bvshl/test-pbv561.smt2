(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvshl (bvnot s) s)) (bvlshr (bvshl s s) s)))
(check-sat)
(exit)