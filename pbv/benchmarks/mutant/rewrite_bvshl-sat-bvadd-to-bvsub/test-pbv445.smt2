(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvule t (bvsub t (bvsub s t))) (bvule t (bvsub s (bvsub t (_ bv1 k))))))
(check-sat)
(exit)