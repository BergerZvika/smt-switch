(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvsub s (bvudiv (_ bv0 k) t))) (distinct s (bvudiv s (bvudiv t t)))))
(check-sat)