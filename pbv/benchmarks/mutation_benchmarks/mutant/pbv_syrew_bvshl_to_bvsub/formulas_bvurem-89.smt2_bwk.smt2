(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvsub s (bvurem s t))) (distinct (_ bv0 k) (bvurem s t))))
(check-sat)
