(set-logic ALL)
(declare-const k Int)
(declare-fun %op0RHS () (_ BitVec k))
(assert (and (bvult %op0RHS (_ bv0 k)) (not (= (bvand (bvshl (_ bv1 k) %op0RHS) (_ bv1 k)) (pzero_extend (- k 1) (ite (= %op0RHS (_ bv0 k)) (_ bv1 1) (_ bv0 1)))))))
(check-sat)