(set-logic ALL)
(declare-const k Int)
(declare-fun %X () (_ BitVec k))
(assert (not (= (bvsgt %X (bvnot (_ bv0 k))) (= (bvor %X (bvshl (_ bv1 k) (bvsub (_ bvk k) (_ bv1 k)))) (_ bv0 k)))))
(check-sat)