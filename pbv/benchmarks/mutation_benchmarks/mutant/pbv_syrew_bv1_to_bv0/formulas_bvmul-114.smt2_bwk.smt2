(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult s (bvand (_ bv0 k) (bvmul s t))) (distinct s s)))
(check-sat)
