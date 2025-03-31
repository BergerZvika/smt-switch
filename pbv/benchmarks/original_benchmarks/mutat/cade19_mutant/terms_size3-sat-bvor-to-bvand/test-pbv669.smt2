(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvshl (bvshl s s) t)) (bvadd s (bvshl (bvshl s s) t))))
(check-sat)
(exit)