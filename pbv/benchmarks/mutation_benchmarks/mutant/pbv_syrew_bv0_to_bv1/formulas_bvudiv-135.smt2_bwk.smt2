(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvudiv s (bvudiv (_ bv1 k) t))) (distinct s (bvnot (bvudiv (_ bv0 k) t)))))
(check-sat)
