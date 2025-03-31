(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvsle (bvand s t) s) (bvsle t (bvor s t)))))
(check-sat)
(exit)