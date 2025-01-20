(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvshl s (bvlshr (_ bv1 k) (bvnot t))) (bvshl s (bvudiv t (bvnot (_ bvk k))))))
(check-sat)
