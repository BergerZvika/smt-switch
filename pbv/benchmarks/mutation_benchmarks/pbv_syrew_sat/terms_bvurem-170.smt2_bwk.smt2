(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvand s (bvurem (_ bv1 k) (bvshl t s))) (bvand s (_ bv1 k)))))
(check-sat)
