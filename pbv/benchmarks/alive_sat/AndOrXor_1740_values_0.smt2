(set-logic ALL)
(declare-const k Int)
(declare-fun C1 () (_ BitVec k))
(declare-fun C3 () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(declare-fun C2 () (_ BitVec k))
(assert (not (let ((_let_0 (bvadd %X C3))) (and (= (bvadd C2 C3) C1) (not (= (or (bvult _let_0 C1) (= %X C2)) (bvule _let_0 C1)))))))
(check-sat)