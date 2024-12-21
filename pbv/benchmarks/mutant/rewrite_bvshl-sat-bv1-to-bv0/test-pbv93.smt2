(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl (_ bv0 k) s) (bvshl t s)) (bvshl (_ bv1 k) (bvadd s (bvshl t s)))))
(check-sat)
(exit)