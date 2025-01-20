(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult s (bvshl s (bvurem s (_ bvk k)))) (bvult s (bvshl s s))))
(check-sat)