(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub (_ bv1 k) (bvsub s (bvor s t))) (bvsub t (bvsub (_ bv1 k) (bvand s t)))))
(check-sat)
(exit)