(set-logic ALL)
(declare-const k Int)
(declare-fun C1 () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(declare-fun C2 () (_ BitVec k))
(assert (let ((_let_0 (not (= %X C1)))) (and (bvult C1 C2) (not (= (or _let_0 (= %X C2)) _let_0)))))
(check-sat)