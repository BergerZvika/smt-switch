(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr (bvudiv s t) t) (bvudiv (bvlshr s t) t)))
(check-sat)
