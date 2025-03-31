(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvnot s) (bvand s t)) (bvand s (bvand t (bvneg s)))))
(check-sat)
(exit)