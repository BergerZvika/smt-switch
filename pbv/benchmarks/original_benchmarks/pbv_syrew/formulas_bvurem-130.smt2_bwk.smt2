(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvurem s (bvshl (_ bv1 k) t))) (distinct (_ bv0 k) (bvlshr s t))))
(check-sat)
