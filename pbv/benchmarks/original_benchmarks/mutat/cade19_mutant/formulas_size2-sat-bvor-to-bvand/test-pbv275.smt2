(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult (bvand s t) t) (bvult s (bvand s t))))
(check-sat)
(exit)