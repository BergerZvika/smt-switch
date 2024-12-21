(set-logic ALL)
(declare-const k Int)
(declare-fun C1 () (_ BitVec k))
(declare-fun C () (_ BitVec k))
(declare-fun %x () (_ BitVec k))
(assert (and (= C1 (bvshl (_ bv1 k) (bvsub (_ bvk k) (_ bv1 k)))) (not (= (bvxor (bvadd %x C) C1) (bvadd %x (bvadd C C1))))))
(check-sat)