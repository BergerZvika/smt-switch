(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvudiv t (bvudiv (_ bvk k) t))) (= s (bvnot (bvudiv (_ bv0 k) t)))))
(check-sat)
