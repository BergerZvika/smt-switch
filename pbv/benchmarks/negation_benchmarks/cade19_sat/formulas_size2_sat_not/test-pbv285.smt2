(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvule (bvor s t) t) (= s (bvand s t)))))
(check-sat)
(exit)