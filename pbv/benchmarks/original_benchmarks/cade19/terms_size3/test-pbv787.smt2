(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvmul (bvmul t t) t)) (bvshl s (bvmul t (bvmul t t)))))
(check-sat)
(exit)