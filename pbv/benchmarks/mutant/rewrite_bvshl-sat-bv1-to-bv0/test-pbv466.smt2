(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (distinct t (bvsub (_ bv0 k) (bvadd s t))) (distinct s (bvsub (_ bv1 k) (bvadd t t)))))
(check-sat)
(exit)