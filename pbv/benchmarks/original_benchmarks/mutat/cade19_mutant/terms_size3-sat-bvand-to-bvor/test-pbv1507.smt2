(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvmul t (bvor s t)) s) (bvmul (bvand s t) (bvshl t s))))
(check-sat)
(exit)