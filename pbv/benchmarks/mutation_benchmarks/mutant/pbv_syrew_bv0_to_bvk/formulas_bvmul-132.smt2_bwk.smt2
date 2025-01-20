(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvlshr (bvmul s s) s)) (= s (_ bvk k))))
(check-sat)
