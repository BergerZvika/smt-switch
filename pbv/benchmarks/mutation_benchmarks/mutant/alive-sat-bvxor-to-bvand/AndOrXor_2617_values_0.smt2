(set-logic ALL)
(declare-const k Int)
(declare-fun %b () (_ BitVec k))
(declare-fun %a () (_ BitVec k))
(assert (not (= (bvand (bvand %a (bvxor %b (bvnot (_ bv0 k)))) (bvand (bvxor %a (bvnot (_ bv0 k))) %b)) (bvxor %a %b))))
(check-sat)