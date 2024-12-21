(set-logic ALL)
(declare-const k Int)
(declare-fun C2 () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(declare-fun C1 () (_ BitVec k))
(assert (and (bvsle C1 C2) (= C1 (bvshl (_ bv1 k) (bvadd (_ bvk k) (_ bv1 k)))) (not (= C1 C2)) (not (= (or (bvslt %X C1) (bvsge %X C2)) (bvsgt %X (bvsub C2 (_ bv1 k)))))))
(check-sat)