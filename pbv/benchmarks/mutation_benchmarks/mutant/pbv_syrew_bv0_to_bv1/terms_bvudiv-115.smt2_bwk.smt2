(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr s (bvudiv t (bvlshr s s))) (_ bv1 k)))
(check-sat)
