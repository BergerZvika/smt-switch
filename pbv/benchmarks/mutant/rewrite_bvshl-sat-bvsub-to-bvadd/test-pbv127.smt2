(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd (bvshl (bvadd s (_ bv1 k)) (_ bv1 k)) s) (bvadd s (bvshl (_ bv1 k) (_ bv1 k)))))
(check-sat)
(exit)