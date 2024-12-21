(set-logic ALL)
(declare-const k Int)
(declare-fun C2 () (_ BitVec k))
(declare-fun C1 () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(assert (not (= (bvand (bvxor %X C1) C2) (bvxor (bvand %X C2) (bvand C1 C2)))))
(check-sat)