(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsle (bvand t s) s) (bvsle (bvor s t) s)))
(check-sat)
(exit)