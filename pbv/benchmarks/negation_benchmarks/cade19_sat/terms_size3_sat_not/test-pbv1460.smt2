(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvor (bvand s (bvshl s t)) t) (bvadd (bvand s (bvshl s t)) t))))
(check-sat)
(exit)