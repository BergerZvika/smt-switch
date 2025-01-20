(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand s (bvurem (_ bv0 k) (bvlshr s (_ bv1 k)))) (bvurem s (bvlshr s (_ bv1 k)))))
(check-sat)
