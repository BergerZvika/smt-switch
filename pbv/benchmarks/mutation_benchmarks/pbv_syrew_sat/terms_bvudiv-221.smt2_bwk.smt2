(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvshl s (bvudiv (_ bv0 k) (bvshl (_ bv1 k) t))) (bvshl s (bvlshr t (bvshl t t))))))
(check-sat)
