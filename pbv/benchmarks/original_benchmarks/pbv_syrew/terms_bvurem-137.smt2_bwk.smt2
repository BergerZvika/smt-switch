(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr s (bvurem t (bvshl (_ bv1 k) t))) (bvlshr s t)))
(check-sat)