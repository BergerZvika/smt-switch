(set-logic ALL)
(declare-const k Int)
(declare-fun C2 () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(declare-fun C1 () (_ BitVec k))
(assert (let ((_let_0 (bvslt %X C2))) (and (bvsle C1 C2) (= C1 (bvlshr (_ bv1 k) (bvsub (_ bvk k) (_ bv1 k)))) (not (= (and (bvsge %X C1) _let_0) _let_0)))))
(check-sat)