(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvule s (bvudiv s (bvshl s t))) (bvule (bvshl s t) (_ bv1 k)))))
(check-sat)
