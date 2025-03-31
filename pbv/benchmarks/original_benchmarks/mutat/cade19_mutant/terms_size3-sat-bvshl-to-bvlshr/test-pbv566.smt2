(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul s (bvlshr (bvneg t) s)) (bvneg (bvmul s (bvshl t s)))))
(check-sat)
(exit)