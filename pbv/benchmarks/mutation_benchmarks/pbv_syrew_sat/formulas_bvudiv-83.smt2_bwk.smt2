(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (= s (bvudiv s (bvudiv s s))) (= s s))))
(check-sat)
