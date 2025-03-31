(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvmul s (bvmul s s)) t) (bvmul s (bvmul s (bvshl s t)))))
(check-sat)
(exit)