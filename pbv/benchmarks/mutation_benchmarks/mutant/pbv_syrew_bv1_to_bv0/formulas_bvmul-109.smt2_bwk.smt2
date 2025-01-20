(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule s (bvlshr (_ bv0 k) (bvmul s s))) (= s (_ bv0 k))))
(check-sat)
