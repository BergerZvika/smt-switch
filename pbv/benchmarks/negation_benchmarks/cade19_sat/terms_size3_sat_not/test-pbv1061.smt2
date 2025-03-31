(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvmul t (bvshl s (bvor s t))) (bvmul s (bvshl t (bvor s t))))))
(check-sat)
(exit)