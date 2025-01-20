(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult s (bvadd s (bvshl (_ bv1 k) t))) (bvult s (bvshl s t))))
(check-sat)