(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvule s (bvsub (_ bv0 k) (bvadd t (_ bv0 k)))) (bvule s (bvadd s t))))
(check-sat)
(exit)