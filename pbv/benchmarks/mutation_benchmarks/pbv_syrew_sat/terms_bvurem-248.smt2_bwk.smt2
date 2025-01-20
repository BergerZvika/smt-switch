(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvlshr s (bvshl (bvshl s s) s)) (bvlshr s (bvurem s (bvurem (_ bv1 k) s))))))
(check-sat)
