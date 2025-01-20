(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvudiv s (bvsub t (bvlshr (_ bv1 k) t))) (bvudiv s t)))
(check-sat)
