(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvmul t (bvshl (bvadd s s) s)) (bvmul s (bvshl (bvshl t s) s)))))
(check-sat)
(exit)