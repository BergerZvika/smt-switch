(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (distinct s (bvand s (bvurem s t))) (distinct s (bvurem s t)))))
(check-sat)
