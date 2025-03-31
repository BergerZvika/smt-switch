(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul t (bvmul s (bvlshr s t))) (bvmul s (bvmul t (bvlshr s t)))))
(check-sat)
(exit)