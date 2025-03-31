(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvadd s t) (bvand s t)) (bvand s (bvand t (bvadd s t)))))
(check-sat)
(exit)