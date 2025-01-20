(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvult s (bvudiv s (bvlshr s (_ bv1 k)))) (bvule s (_ bv1 k)))))
(check-sat)