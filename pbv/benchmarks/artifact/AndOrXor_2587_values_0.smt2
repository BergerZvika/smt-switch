(set-logic ALL)
(declare-const k Int)
(declare-fun %op1 () (_ BitVec k))
(declare-fun %a () (_ BitVec k))
(assert (not (= (bvxor (bvand %a %op1) %op1) (bvand (bvxor %a (bvnot (_ bv0 k))) %op1))))
(check-sat)