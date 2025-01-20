(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvadd s (bvurem s (bvshl t t))) (bvurem s (bvshl t t))))
(check-sat)
