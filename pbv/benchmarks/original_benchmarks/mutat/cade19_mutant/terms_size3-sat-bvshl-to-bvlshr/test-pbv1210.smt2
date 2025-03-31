(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvmul s s) (bvlshr s s)) (bvmul s (bvlshr s (bvshl s s)))))
(check-sat)
(exit)