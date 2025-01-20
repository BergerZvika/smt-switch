(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvor s (bvurem (_ bv1 k) (bvshl t t))) (bvand s (_ bv1 k))))
(check-sat)
