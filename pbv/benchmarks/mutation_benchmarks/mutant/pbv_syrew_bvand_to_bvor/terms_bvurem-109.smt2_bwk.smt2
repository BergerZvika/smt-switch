(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvor s (bvshl t (bvurem t (_ bv0 k)))) (bvand s (bvshl t t))))
(check-sat)