(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand t (bvsub s (bvand s (_ bv0 k)))) (bvand s (bvsub t (bvand t (_ bv1 k))))))
(check-sat)
(exit)