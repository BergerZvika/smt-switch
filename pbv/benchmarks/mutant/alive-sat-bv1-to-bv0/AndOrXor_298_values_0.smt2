(set-logic ALL)
(declare-const k Int)
(declare-fun C2 () (_ BitVec k))
(declare-fun C1 () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(assert (let ((_let_0 (bvneg C1))) (and (bvsle C1 C2) (not (= C1 C2)) (not (= (or (bvslt %X C1) (bvsge %X C2)) (bvugt (bvadd %X _let_0) (bvadd _let_0 (bvsub C2 (_ bv0 k)))))))))
(check-sat)