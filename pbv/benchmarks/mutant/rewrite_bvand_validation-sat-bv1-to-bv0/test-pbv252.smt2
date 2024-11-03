(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvnot (bvand s (bvshl s s))) (_ bv0 k)) (bvnot (_ bv1 k))))
(check-sat)
(exit)