(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvudiv s (bvnot (bvudiv (_ bv1 k) s))) (bvudiv s (bvnot (bvudiv (_ bvk k) s)))))
(check-sat)
