(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub (_ bv1 k) (bvsub t (bvand s t))) (bvsub s (bvsub (_ bv1 k) (bvor s t)))))
(check-sat)
(exit)