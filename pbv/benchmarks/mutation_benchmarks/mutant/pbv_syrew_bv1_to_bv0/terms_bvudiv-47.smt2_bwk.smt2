(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvnot (bvudiv (_ bv0 k) (bvlshr (_ bv1 k) s))) (bvshl (bvudiv (_ bv0 k) s) (_ bv1 k))))
(check-sat)
