(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul t (bvshl s (bvneg s))) (bvmul s (bvshl t (bvnot s)))))
(check-sat)
(exit)