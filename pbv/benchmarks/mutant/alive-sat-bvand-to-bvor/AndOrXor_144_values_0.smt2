(set-logic ALL)
(declare-const k Int)
(declare-fun C2 () (_ BitVec k))
(declare-fun C1 () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(assert (not (= (bvor (bvor %X C1) C2) (bvand (bvor %X (bvand C1 C2)) C2))))
(check-sat)