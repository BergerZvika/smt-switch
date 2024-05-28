(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvsub t (bvadd (_ bv1 k) (_ bv1 k)))) (bvsub s (bvand s (bvsub (_ bv1 k) t)))))
(check-sat)
(exit)