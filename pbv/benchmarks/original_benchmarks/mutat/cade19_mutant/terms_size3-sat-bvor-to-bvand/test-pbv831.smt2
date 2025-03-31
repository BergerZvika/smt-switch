(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul s (bvand (bvlshr t t) s)) (bvmul s s)))
(check-sat)
(exit)