(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvshl s (bvshl (_ bv1 k) t)) t) (bvshl s (bvadd t (bvshl (_ bv1 k) t))))))
(check-sat)
(exit)