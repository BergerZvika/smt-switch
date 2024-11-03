(set-logic ALL)
(declare-const k Int)
(declare-fun %D () (_ BitVec k))
(declare-fun %A () (_ BitVec k))
(assert (not (= (bvor (bvadd %A (bvxor %D (bvnot (_ bv0 k)))) (bvand (bvxor %A (bvnot (_ bv0 k))) %D)) (bvxor %A %D))))
(check-sat)