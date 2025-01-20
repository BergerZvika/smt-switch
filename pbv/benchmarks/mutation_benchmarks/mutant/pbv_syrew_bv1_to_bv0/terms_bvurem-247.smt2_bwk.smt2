(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvshl s (bvshl (bvshl s s) s)) (bvlshr s (bvurem s (bvurem (_ bv0 k) s)))))
(check-sat)
