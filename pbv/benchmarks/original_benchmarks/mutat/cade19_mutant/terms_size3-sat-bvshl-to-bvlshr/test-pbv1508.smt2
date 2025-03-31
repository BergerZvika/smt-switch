(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvmul t (bvor s t)) s) (bvmul (bvor s t) (bvshl t s))))
(check-sat)
(exit)