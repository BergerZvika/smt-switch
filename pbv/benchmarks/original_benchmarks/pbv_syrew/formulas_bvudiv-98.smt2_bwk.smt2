(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvudiv s (bvlshr s (_ bv1 k)))) (distinct (_ bv1 k) (bvlshr s (_ bv1 k)))))
(check-sat)
