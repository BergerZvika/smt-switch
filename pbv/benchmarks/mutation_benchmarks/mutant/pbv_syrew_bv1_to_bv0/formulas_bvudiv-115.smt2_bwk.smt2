(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule s (bvudiv s (bvand t (_ bv0 k)))) (= s s)))
(check-sat)
