(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvshl (bvshl s t) t) s) (bvshl (bvshl (bvshl s s) t) t))))
(check-sat)
(exit)