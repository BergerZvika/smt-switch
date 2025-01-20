(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvshl (_ bv1 k) (bvadd s t))) (distinct (_ bv1 k) (bvshl s t))))
(check-sat)
