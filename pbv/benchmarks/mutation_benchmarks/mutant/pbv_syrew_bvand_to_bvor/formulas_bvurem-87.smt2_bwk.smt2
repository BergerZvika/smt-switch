(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvor s (bvurem s t))) (distinct s (bvurem s t))))
(check-sat)
