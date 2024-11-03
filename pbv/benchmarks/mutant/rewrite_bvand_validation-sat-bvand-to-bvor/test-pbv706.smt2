(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvor t (bvand (_ bv1 k) (bvshl (_ bv1 k) t)))) s))
(check-sat)
(exit)