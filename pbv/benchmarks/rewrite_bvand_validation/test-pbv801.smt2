(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvshl (_ bv1 k) (bvnot (bvshl t s)))) (_ bv0 k)))
(check-sat)
(exit)