(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd (bvshl s s) (bvand s t)) (bvor s (bvadd t (bvshl s s)))))
(check-sat)
(exit)