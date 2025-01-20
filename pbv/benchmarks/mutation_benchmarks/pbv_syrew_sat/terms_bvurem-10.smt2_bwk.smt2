(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvurem s (bvurem t (_ bv0 k))) (bvurem s t))))
(check-sat)
