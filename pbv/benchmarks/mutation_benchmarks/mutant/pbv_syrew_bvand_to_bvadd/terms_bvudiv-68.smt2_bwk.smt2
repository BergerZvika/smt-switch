(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvshl s (bvnot (bvudiv (_ bv1 k) t))) (bvadd s (bvudiv (_ bv0 k) t))))
(check-sat)
