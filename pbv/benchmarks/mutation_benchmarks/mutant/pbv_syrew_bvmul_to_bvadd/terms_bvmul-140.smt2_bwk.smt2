(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvadd s (bvshl (bvshl (_ bv1 k) s) t)) (bvshl (bvshl s s) t)))
(check-sat)
