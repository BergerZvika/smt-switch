(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr s (bvudiv s (bvsub t s))) (bvlshr s (bvlshr s (bvshl t s)))))
(check-sat)
