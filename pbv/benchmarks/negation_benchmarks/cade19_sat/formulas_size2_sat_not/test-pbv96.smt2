(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvsle s (bvand t s)) (bvsle s (bvand s t)))))
(check-sat)
(exit)