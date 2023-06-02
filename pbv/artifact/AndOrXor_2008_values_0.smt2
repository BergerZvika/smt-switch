(set-logic ALL)
(declare-const k Int)
(declare-fun %B () (_ BitVec k))
(declare-fun C1 () (_ BitVec k))
(declare-fun %A () (_ BitVec k))
(declare-fun C2 () (_ BitVec k))
(assert (and (= (bvxor C1 C2) (_ bv15 k)) (not (= (bvor (bvand (bvxor %A %B) C1) (bvand %B C2)) (bvxor (bvand %A C1) %B)))))
(assert true)
(check-sat)