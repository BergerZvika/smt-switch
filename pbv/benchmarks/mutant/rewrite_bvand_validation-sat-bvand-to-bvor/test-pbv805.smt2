(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvshl (_ bv1 k) (bvnot (bvand t (_ bv1 k))))) (_ bv0 k)))
(check-sat)
(exit)