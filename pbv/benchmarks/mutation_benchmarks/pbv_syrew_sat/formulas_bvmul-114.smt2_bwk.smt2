(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvult s (bvand (_ bv1 k) (bvmul s t))) (distinct s s))))
(check-sat)
