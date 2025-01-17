(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub s (bvand (_ bv1 k) (bvsub (_ bv1 k) t))) (bvsub s (bvand t (_ bv1 k)))))
(check-sat)
(exit)