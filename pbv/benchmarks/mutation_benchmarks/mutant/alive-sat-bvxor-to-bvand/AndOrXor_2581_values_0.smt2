(set-logic ALL)
(declare-const k Int)
(declare-fun %op1 () (_ BitVec k))
(declare-fun %a () (_ BitVec k))
(assert (not (= (bvand (bvor %a %op1) %op1) (bvand %a (bvxor %op1 (bvnot (_ bv0 k)))))))
(check-sat)