(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvshl t (bvurem s (_ bv0 k)))) (= s (bvshl t s))))
(check-sat)
