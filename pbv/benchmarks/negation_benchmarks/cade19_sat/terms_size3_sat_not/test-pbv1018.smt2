(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvmul t (bvshl s (bvneg s))) (bvmul s (bvshl t (bvneg s))))))
(check-sat)
(exit)