(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvadd s (bvshl s (bvudiv (_ bv1 k) s))) (bvlshr s (bvudiv (_ bv1 k) s))))
(check-sat)