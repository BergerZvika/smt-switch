(set-logic ALL)
(declare-const k Int)
(declare-fun %X () (_ BitVec k))
(assert (not (= (bvsgt %X (_ bv15 k)) (= (bvand %X (bvshl (_ bv1 k) (bvsub (_ bv4 k) (_ bv1 k)))) (_ bv0 k)))))
(assert true)
(check-sat)