(set-logic ALL)
(declare-const k Int)
(declare-fun C () (_ BitVec k))
(declare-fun %x () (_ BitVec k))
(assert (and (= C (bvshl (_ bv1 k) (bvsub (_ bvk k) (_ bv1 k)))) (not (= (bvsub %x C) (bvxor %x C)))))
(check-sat)