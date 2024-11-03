(set-logic ALL)
(declare-const k Int)
(declare-fun %b () (_ BitVec k))
(declare-fun %a () (_ BitVec k))
(assert (not (= (bvxor (bvand %a (bvxor %b (bvnot (_ bv0 k)))) (bvor (bvxor %a (bvnot (_ bv0 k))) %b)) (bvxor %a %b))))
(check-sat)