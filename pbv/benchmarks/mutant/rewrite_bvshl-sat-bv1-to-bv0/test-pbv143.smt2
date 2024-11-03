(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl (bvshl (_ bv0 k) (_ bv1 k)) t) s) (bvshl (bvshl (bvshl (_ bv1 k) s) t) (_ bv1 k))))
(check-sat)
(exit)