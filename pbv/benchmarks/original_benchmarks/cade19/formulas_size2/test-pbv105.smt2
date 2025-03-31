(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvslt s (bvand t t)) (bvslt s t)))
(check-sat)
(exit)