(set-logic ALL)
(declare-const k Int)
(declare-fun C1 () (_ BitVec k))
(declare-fun %op1 () (_ BitVec k))
(declare-fun %A () (_ BitVec k))
(assert (not (not (= (bvor (bvor %A C1) %op1) (bvor (bvor %A %op1) C1)))))
(check-sat)