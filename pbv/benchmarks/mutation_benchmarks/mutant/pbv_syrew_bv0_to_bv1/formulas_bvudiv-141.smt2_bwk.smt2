(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvudiv s (bvlshr (_ bv1 k) s))) (distinct s (bvnot (bvudiv (_ bv1 k) s)))))
(check-sat)
