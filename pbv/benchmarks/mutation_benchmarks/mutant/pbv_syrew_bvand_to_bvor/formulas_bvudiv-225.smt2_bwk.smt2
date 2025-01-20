(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule s (bvor t (bvudiv (_ bv0 k) s))) (= s (_ bv0 k))))
(check-sat)
