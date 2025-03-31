(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvlshr (bvnot t) t)) (bvlshr (bvlshr s t) t)))
(check-sat)
(exit)