(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvshl (bvadd s (_ bv1 k)) (_ bv1 k)) t) (bvshl (bvshl (bvadd s (_ bv1 k)) t) (_ bv1 k)))))
(check-sat)
(exit)