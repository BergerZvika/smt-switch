(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvudiv t (bvsub t t))) (distinct s (bvudiv s (bvshl t t)))))
(check-sat)
