(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul t (bvshl s (bvshl s s))) (bvmul s (bvshl t (bvshl s s)))))
(check-sat)
(exit)