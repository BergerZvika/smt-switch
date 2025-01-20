(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult (_ bv1 k) (bvudiv s t)) (bvule t (bvlshr s (_ bv1 k)))))
(check-sat)
