(set-logic ALL)
(declare-const k Int)
(declare-fun %y () (_ BitVec k))
(declare-fun %x () (_ BitVec k))
(assert (and (bvult %y (_ bvk k)) (not (= (bvand (bvashr (bvxor %x (bvnot (_ bv0 k))) %y) (bvnot (_ bv0 k))) (bvashr %x %y)))))
(check-sat)