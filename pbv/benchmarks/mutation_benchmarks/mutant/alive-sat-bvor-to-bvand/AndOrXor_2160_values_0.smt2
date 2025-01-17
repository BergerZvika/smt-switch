(set-logic ALL)
(declare-const k Int)
(declare-fun C2 () (_ BitVec k))
(declare-fun C1 () (_ BitVec k))
(declare-fun C4 () (_ BitVec k))
(declare-fun C3 () (_ BitVec k))
(declare-fun %V1 () (_ BitVec k))
(assert (and (= (bvand C1 C2) (_ bv0 k)) (= (bvand C3 (bvnot C1)) (_ bv0 k)) (= (bvand C4 (bvnot C2)) (_ bv0 k)) (not (= (bvand (bvand (bvor %V1 C3) C1) (bvand (bvor %V1 C4) C2)) (bvand (bvor %V1 (bvor C3 C4)) (bvor C1 C2))))))
(check-sat)