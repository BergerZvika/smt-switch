(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvsub s (bvudiv t (bvshl s t))) (bvshl s (bvlshr t (bvshl s t)))))
(check-sat)
