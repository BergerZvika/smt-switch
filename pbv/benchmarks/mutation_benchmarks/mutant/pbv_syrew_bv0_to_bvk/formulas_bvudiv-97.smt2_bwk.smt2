(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult s (bvudiv s (bvshl s (_ bv1 k)))) (= (_ bvk k) (bvshl s (_ bv1 k)))))
(check-sat)