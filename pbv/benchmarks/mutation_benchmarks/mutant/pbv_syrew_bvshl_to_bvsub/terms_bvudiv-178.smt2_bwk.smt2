(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand s (bvsub t (bvudiv (_ bv0 k) t))) (bvand s t)))
(check-sat)
