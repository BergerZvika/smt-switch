(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvmul t (bvshl s (_ bv1 k)))) (= s (_ bvk k))))
(check-sat)
