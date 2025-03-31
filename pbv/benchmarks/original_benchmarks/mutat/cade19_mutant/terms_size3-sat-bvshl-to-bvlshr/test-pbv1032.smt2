(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul t (bvlshr s (bvmul s s))) (bvmul s (bvshl t (bvmul s s)))))
(check-sat)
(exit)