(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvudiv s (bvshl t (bvudiv t t))) (bvudiv s (bvshl t (_ bv1 k)))))
(check-sat)
