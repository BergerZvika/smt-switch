(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvslt (bvor s t) s) (bvslt t (bvand s t)))))
(check-sat)
(exit)