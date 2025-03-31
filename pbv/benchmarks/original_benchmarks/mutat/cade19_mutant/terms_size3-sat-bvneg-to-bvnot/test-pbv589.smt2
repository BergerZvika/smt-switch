(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvor (bvnot t) t)) (bvand s (bvor t (bvneg t)))))
(check-sat)
(exit)