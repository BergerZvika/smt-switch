(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub (bvshl (bvsub (_ bv1 k) s) t) t) (bvsub (_ bv0 k) (bvadd t (bvshl s t)))))
(check-sat)
(exit)