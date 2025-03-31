(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvand s (bvlshr s t)) t) (bvand s (bvlshr s t))))
(check-sat)
(exit)