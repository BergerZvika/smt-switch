(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr s (bvsub t (bvudiv t t))) (bvlshr s (bvshl t (_ bv1 k)))))
(check-sat)
