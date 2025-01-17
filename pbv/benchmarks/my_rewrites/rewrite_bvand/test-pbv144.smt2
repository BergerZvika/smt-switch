(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvsub (bvand t (_ bv1 k)) (_ bv1 k))) (bvor s (bvsub t (bvor t (_ bv1 k))))))
(check-sat)
(exit)