(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul t (bvshl (bvsub s s) t)) (bvmul s (bvshl (bvadd t t) t))))
(check-sat)
(exit)