(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult s (bvadd s (bvnot (_ bv0 k)))) (bvult s (bvshl s (_ bv1 k)))))
(check-sat)
