(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvmul s (bvshl t s))) (distinct s (_ bvk k))))
(check-sat)
