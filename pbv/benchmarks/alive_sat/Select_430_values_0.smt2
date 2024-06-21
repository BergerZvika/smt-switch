(set-logic ALL)
(declare-const k Int)
(declare-fun %X () (_ BitVec k))
(declare-fun C2 () (_ BitVec k))
(declare-fun C1 () (_ BitVec k))
(assert (not (and (= C1 (bvnot C2)) (= (bvand C1 (bvsub C1 (_ bv1 k))) (_ bv0 k)) (not (= (ite (= (bvand %X C1) (_ bv0 k)) (bvand %X C2) %X) %X)) (not (= C1 (_ bv0 k))))))
(check-sat)