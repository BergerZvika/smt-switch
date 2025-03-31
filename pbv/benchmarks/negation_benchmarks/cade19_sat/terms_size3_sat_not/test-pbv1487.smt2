(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvlshr (bvshl s (bvmul t t)) t) (bvlshr (bvshl s t) (bvmul t t)))))
(check-sat)
(exit)