(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule s (bvshl (bvand s (_ bv1 k)) s)) (bvule s (bvadd s (bvshl s s)))))
(check-sat)
