(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvudiv s (bvudiv t (bvlshr (_ bv1 k) t))) (bvudiv s (bvnot (bvudiv (_ bv1 k) t)))))
(check-sat)
