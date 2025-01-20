(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr s (bvshl (_ bv1 k) (bvurem (_ bv1 k) s))) (bvlshr s (bvshl (_ bv1 k) (_ bv1 k)))))
(check-sat)
