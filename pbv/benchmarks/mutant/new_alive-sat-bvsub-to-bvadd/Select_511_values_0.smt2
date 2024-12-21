(set-logic ALL)
(declare-const k Int)
(declare-fun %X () (_ BitVec k))
(declare-fun C2 () (_ BitVec k))
(declare-fun C () (_ BitVec k))
(assert (and (= C2 (bvadd C (_ bv1 k))) (not (= C (bvshl (_ bv1 k) (bvsub (_ bvk k) (_ bv1 k))))) (not (= (ite (bvslt %X C) %X C2) (ite (bvsgt %X C2) C2 %X)))))
(check-sat)