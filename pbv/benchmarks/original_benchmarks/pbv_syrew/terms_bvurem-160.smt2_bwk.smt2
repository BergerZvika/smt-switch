(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand s (bvlshr (_ bv1 k) (bvlshr s (_ bv1 k)))) (bvurem s (bvurem (_ bv1 k) s))))
(check-sat)
