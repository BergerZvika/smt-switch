(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvule t (bvand s t)) (= s (bvor s t)))))
(check-sat)
(exit)