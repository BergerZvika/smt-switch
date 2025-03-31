(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvlshr (bvneg s) s)) (bvlshr (bvlshr s s) s)))
(check-sat)
(exit)