(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (= s (bvudiv s (bvudiv t t))) (bvule s (bvnot (bvudiv (_ bv0 k) t))))))
(check-sat)
