(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvadd s (bvlshr (bvshl (_ bv1 k) t) t)) (bvshl s (bvlshr t (bvshl t t)))))
(check-sat)
