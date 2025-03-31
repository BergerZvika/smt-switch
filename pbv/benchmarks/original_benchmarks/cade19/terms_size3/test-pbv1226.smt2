(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvshl s s) (bvand s t)) (bvadd (bvshl s s) (bvand s t))))
(check-sat)
(exit)