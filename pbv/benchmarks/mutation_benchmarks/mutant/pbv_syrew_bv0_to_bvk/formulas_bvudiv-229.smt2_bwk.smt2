(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult s (bvlshr t (bvudiv (_ bvk k) s))) (bvult s (bvshl t (bvudiv (_ bv0 k) s)))))
(check-sat)