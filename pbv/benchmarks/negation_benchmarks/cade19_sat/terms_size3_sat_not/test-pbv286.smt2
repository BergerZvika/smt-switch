(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvmul s (bvmul s (bvshl s s))) (bvmul s (bvshl s s)))))
(check-sat)
(exit)