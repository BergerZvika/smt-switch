(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (distinct t (bvadd s (bvshl (_ bv0 k) s))) (distinct s (bvsub t (bvshl (_ bv1 k) s)))))
(check-sat)
(exit)