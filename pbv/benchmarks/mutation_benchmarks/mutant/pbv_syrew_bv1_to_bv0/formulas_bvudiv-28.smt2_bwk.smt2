(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct (_ bv0 k) (bvudiv (_ bv0 k) s)) (= s s)))
(check-sat)
