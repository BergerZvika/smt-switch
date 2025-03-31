(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvule (bvand s t) s) (= s (bvor s t))))
(check-sat)
(exit)