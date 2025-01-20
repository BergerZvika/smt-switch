(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvurem t (bvor s (_ bv1 k)))) (distinct s (bvshl t (bvand s (_ bv1 k))))))
(check-sat)
