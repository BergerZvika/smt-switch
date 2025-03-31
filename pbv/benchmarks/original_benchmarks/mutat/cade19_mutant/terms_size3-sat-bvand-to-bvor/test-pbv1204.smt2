(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvadd s s) (bvand s t)) (bvand s (bvand t (bvadd s s)))))
(check-sat)
(exit)