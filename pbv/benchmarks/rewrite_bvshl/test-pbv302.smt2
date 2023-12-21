(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvule s (bvadd t (bvsub t (_ bv1 k)))) (bvule s (bvsub s (bvadd t t)))))
(check-sat)
(exit)