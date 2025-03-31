(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvor (bvand s t) (bvshl s t)) (bvadd (bvand s t) (bvshl s t)))))
(check-sat)
(exit)