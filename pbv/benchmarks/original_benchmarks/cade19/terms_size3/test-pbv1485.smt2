(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvlshr s (bvmul t t)) t) (bvlshr (bvlshr s t) t)))
(check-sat)
(exit)