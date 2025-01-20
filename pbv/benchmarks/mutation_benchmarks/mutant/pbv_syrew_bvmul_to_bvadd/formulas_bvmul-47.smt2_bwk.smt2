(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvadd s (bvshl (_ bv1 k) t))) (= s (bvshl s t))))
(check-sat)
