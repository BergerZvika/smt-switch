(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvadd s (bvlshr t (bvshl (_ bv1 k) s))) (bvmul s (bvlshr t (bvshl s s)))))
(check-sat)