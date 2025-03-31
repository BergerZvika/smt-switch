(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvslt (bvand s t) s) (bvslt t (bvor s t))))
(check-sat)
(exit)