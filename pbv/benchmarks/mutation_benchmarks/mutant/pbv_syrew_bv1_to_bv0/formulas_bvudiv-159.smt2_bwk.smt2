(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvand s (bvudiv (_ bv0 k) t))) (bvult (bvudiv (_ bv1 k) s) t)))
(check-sat)
