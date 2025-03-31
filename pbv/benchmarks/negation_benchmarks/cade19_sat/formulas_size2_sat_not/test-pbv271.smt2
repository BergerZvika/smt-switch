(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvult (bvand s t) s) (bvult t (bvor s t)))))
(check-sat)
(exit)