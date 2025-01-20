(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvshl s (bvlshr t (bvudiv (_ bvk k) t))) (bvshl s t)))
(check-sat)
