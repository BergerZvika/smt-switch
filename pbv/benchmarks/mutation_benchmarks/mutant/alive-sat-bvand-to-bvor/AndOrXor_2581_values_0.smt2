(set-logic ALL)
(declare-const k Int)
(declare-fun %op1 () (_ BitVec k))
(declare-fun %a () (_ BitVec k))
(assert (not (= (bvxor (bvor %a %op1) %op1) (bvor %a (bvxor %op1 (bvnot (_ bv0 k)))))))
(check-sat)