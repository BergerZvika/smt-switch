(set-logic ALL)
(declare-const k Int)
(declare-fun %X () (_ BitVec k))
(declare-fun C2 () (_ BitVec k))
(declare-fun C () (_ BitVec k))
(assert (and (= C2 (bvadd C (_ bv1 k))) (not (= C (bvsub (bvshl (_ bv1 k) (bvsub (_ bv0 k) (_ bv1 k))) (_ bv1 k)))) (not (= (ite (bvsgt %X C) %X C2) (ite (bvslt %X C2) C2 %X)))))
(check-sat)