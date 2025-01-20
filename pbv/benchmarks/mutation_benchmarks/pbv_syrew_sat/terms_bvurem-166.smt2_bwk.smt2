(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvurem s (bvurem (_ bv1 k) (bvlshr s (_ bv1 k)))) (bvshl s (bvshl s (bvshl s s))))))
(check-sat)
