(set-logic ALL)
(declare-const k Int)
(declare-fun C () (_ BitVec k))
(declare-fun %x () (_ BitVec k))
(assert (not (= (bvadd C (bvxor %x (bvnot (_ bv0 k)))) (bvadd %x (bvadd C (_ bv1 k))))))
(check-sat)