(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvadd s (bvlshr (_ bv1 k) (bvlshr t s))) (bvlshr s (bvmul s (bvlshr t s)))))
(check-sat)
