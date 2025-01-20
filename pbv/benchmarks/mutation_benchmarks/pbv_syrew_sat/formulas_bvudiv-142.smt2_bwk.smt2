(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (= s (bvudiv s (bvlshr (_ bv1 k) s))) (= s (bvnot (bvudiv (_ bv0 k) s))))))
(check-sat)
