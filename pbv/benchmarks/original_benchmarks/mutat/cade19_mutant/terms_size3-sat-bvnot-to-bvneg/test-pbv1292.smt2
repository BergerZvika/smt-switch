(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvand s t) (bvneg t)) (bvlshr s (bvnot t))))
(check-sat)
(exit)