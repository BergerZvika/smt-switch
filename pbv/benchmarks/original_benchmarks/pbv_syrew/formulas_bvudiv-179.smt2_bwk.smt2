(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvshl t (bvudiv s t))) (= s (bvshl t s))))
(check-sat)
