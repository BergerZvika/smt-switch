(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvnot (bvudiv (_ bv1 k) s))) (= s (bvnot (bvudiv (_ bv1 k) s)))))
(check-sat)
