(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsle (bvor s t) s) (bvsle t (bvand s t))))
(check-sat)
(exit)