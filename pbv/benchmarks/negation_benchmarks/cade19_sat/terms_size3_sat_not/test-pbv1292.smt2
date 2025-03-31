(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvlshr (bvand s t) (bvnot t)) (bvlshr s (bvnot t)))))
(check-sat)
(exit)