(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvshl (bvshl s s) (bvadd s s)) (bvshl (bvshl s s) s)))
(check-sat)
