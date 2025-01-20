(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvudiv s (bvudiv s (bvudiv s t))) (bvudiv s t))))
(check-sat)
