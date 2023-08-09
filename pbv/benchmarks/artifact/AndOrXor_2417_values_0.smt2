(set-logic ALL)
(declare-const k Int)
(declare-fun %y () (_ BitVec k))
(declare-fun %nx () (_ BitVec k))
(assert (not (= (bvxor (bvor (bvxor %nx (_ bv15 k)) %y) (_ bv15 k)) (bvand %nx (bvxor %y (_ bv15 k))))))
(check-sat)