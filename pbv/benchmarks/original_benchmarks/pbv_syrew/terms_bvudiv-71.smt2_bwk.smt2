(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvudiv s (bvudiv s (bvnot (_ bv0 k)))) (bvnot (_ bv0 k))))
(check-sat)
