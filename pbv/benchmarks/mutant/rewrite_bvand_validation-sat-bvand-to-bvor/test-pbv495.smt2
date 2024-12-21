(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvor (bvshl s t) (bvshl (_ bv1 k) s)) t) (bvshl (bvand (bvshl s t) (bvshl t s)) t)))
(check-sat)
(exit)