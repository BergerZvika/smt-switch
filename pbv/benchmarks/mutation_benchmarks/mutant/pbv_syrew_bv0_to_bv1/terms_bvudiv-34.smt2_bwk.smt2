(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvudiv (bvudiv (_ bv1 k) s) s) (bvudiv (_ bv0 k) s)))
(check-sat)
