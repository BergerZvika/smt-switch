(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvsub s (bvlshr t (bvudiv (_ bv0 k) s))) (bvshl s t)))
(check-sat)
