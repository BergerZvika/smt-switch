(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand s (bvlshr t (bvudiv s s))) (bvand s (bvlshr t (_ bv1 k)))))
(check-sat)
