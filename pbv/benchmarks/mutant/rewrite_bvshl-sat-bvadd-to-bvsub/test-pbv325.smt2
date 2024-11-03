(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult s (bvsub (_ bv1 k) (bvsub t t))) (bvule s (bvsub (_ bv0 k) (bvadd t t)))))
(check-sat)
(exit)