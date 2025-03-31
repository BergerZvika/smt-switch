(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvlshr (bvmul s s) (bvshl t s)) (bvmul s (bvlshr s (bvshl t s))))))
(check-sat)
(exit)