(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvudiv s (bvudiv t t))) (bvule s (bvnot (bvudiv (_ bv1 k) t)))))
(check-sat)
