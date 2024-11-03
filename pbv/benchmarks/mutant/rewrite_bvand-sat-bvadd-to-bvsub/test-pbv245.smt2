(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub (_ bv1 k) (bvand s (bvsub (_ bv1 k) s))) (bvor (_ bv1 k) (bvand s (bvsub (_ bv1 k) s)))))
(check-sat)
(exit)