(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvand s t) (bvlshr s t)) (bvand s (bvand t (bvlshr s t)))))
(check-sat)
(exit)