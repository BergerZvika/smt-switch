(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr s (bvudiv t (bvsub t t))) (bvshl s (bvudiv t (bvshl t t)))))
(check-sat)
