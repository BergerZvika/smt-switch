(set-logic ALL)
(declare-const k Int)
(declare-fun C () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(assert (let ((_let_0 (bvadd C (_ bv1 k)))) (and (= (bvand _let_0 (bvsub _let_0 (_ bv1 k))) (_ bv0 k)) (not (= (bvugt %X C) (not (= (bvand %X (bvnot C)) (_ bv0 k))))) (not (= _let_0 (_ bv0 k))))))
(check-sat)