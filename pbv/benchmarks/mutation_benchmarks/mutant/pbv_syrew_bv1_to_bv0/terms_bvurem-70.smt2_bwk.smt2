(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand s (bvurem s (bvurem (_ bv0 k) s))) (bvurem s (bvurem (_ bv1 k) s))))
(check-sat)
