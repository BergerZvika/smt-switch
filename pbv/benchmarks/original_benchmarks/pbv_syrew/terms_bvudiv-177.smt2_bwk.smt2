(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvudiv s (bvand t (bvudiv (_ bv0 k) t))) (bvnot (_ bv0 k))))
(check-sat)
