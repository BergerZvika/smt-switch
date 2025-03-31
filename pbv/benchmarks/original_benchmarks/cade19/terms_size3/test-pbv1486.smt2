(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvlshr s (bvmul t t)) t) (bvshl (bvlshr s t) (bvmul t t))))
(assert (>= k 4))
(check-sat)
(exit)