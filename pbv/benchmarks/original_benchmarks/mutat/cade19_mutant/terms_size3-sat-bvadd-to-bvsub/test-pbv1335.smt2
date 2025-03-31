(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvlshr s t) (bvshl t t)) (bvand (bvlshr s t) (bvsub t t))))
(check-sat)
(exit)