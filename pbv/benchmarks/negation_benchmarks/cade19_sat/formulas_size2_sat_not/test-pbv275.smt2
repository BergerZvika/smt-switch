(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvult (bvand s t) t) (bvult s (bvor s t)))))
(check-sat)
(exit)