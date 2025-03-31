(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvmul s (bvshl t t)) t) (bvsub (bvmul s (bvshl t t)) t)))
(check-sat)
(exit)