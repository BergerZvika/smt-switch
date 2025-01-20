(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvshl s (bvudiv (_ bv0 k) (bvshl t t))) (bvshl s (bvudiv t (bvshl t t)))))
(check-sat)