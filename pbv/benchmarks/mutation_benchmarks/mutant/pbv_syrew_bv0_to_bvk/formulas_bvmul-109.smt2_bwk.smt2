(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule s (bvlshr (_ bv1 k) (bvmul s s))) (= s (_ bvk k))))
(check-sat)