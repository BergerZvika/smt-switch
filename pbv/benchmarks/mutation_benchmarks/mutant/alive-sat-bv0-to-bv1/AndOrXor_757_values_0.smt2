(set-logic ALL)
(declare-const k Int)
(declare-fun C4 () (_ BitVec k))
(declare-fun C2 () (_ BitVec k))
(declare-fun C3 () (_ BitVec k))
(declare-fun C1 () (_ BitVec k))
(declare-fun %a () (_ BitVec k))
(assert (and (= (bvand (bvand C1 C3) (bvxor C2 C4)) (_ bv1 k)) (= (bvand C1 C2) C2) (= (bvand C3 C4) C4) (not (= (and (= (bvand %a C1) C2) (= (bvand %a C3) C4)) (= (bvand %a (bvor C1 C3)) (bvor C2 C4))))))
(check-sat)