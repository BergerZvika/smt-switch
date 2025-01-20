(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvurem s (bvurem s (bvurem (_ bv0 k) s))) (bvlshr s (bvurem s (bvurem (_ bv1 k) s)))))
(check-sat)
