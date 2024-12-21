(set-logic ALL)
(declare-const k Int)
(declare-fun C1 () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(declare-fun C2 () (_ BitVec k))
(assert (and (= C1 C2) (= (bvand C1 (bvsub C1 (_ bv1 k))) (_ bv1 k)) (not (= (ite (= (bvand %X C1) (_ bv0 k)) (bvxor %X C2) %X) (bvor %X C1))) (not (= C1 (_ bv0 k)))))
(check-sat)