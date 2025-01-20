(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvsub s (bvudiv s (bvshl t s))) (bvlshr s (bvlshr s (bvshl t s)))))
(check-sat)
