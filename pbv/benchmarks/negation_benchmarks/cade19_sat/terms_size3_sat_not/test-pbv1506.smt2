(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvmul t (bvadd s t)) s) (bvmul (bvadd s t) (bvshl t s)))))
(check-sat)
(exit)