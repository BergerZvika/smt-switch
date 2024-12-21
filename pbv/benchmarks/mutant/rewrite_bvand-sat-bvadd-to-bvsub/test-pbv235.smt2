(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub (_ bv1 k) (bvor s (bvsub t (_ bv1 k)))) (bvsub s (bvor s (bvsub (_ bv0 k) t)))))
(check-sat)
(exit)