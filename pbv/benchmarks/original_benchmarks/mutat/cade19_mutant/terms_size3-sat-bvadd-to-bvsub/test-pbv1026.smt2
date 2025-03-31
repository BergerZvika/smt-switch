(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul t (bvshl s (bvsub s s))) (bvmul s (bvshl t (bvadd s s)))))
(check-sat)
(exit)