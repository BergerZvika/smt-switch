(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand s (bvudiv (_ bv1 k) (bvsub t s))) (bvlshr s (bvshl t s))))
(check-sat)
