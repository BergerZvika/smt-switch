(set-logic ALL)
(declare-const k Int)
(declare-fun %y () (_ BitVec k))
(declare-fun %nx () (_ BitVec k))
(assert (not (= (bvxor (bvor (bvxor %nx (bvneg (_ bv0 k))) %y) (bvnot (_ bv0 k))) (bvand %nx (bvxor %y (bvnot (_ bv0 k)))))))
(check-sat)