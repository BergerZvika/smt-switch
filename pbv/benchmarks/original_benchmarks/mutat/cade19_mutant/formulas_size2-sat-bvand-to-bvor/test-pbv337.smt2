(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult (bvor t s) s) (bvult (bvand s t) s)))
(check-sat)
(exit)