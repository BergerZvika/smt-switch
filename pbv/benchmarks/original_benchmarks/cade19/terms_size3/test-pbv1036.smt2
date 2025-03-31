(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul t (bvmul s (bvshl s s))) (bvmul s (bvmul s (bvshl t s)))))
(check-sat)
(exit)