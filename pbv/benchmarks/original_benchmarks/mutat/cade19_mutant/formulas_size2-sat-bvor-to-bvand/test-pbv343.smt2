(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvslt (bvand t s) s) (bvslt (bvor s t) s)))
(check-sat)
(exit)