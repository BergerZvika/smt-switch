(set-logic ALL)
(declare-const k Int)
(declare-fun C () (_ BitVec k))
(declare-fun %x () (_ BitVec k))
(assert (and (= C (bvlshr (_ bv1 k) (bvsub (_ bvk k) (_ bv1 k)))) (not (= (bvadd %x C) (bvxor %x C)))))
(check-sat)