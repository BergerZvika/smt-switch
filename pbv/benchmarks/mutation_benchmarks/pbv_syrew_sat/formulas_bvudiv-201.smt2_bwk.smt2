(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvule s (bvudiv t (bvshl t t))) (= s (bvshl s (bvshl t t))))))
(check-sat)
