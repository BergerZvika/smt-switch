(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvsub (bvor t (_ bv0 k)) t)) (bvor s (bvsub (_ bv1 k) (bvand t (_ bv1 k))))))
(check-sat)
(exit)