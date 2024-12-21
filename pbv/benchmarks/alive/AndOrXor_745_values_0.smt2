(set-logic ALL)
(declare-const k Int)
(declare-fun %a () (_ BitVec k))
(declare-fun C1 () (_ BitVec k))
(declare-fun C2 () (_ BitVec k))
(assert (let ((_let_0 (not (= (bvand %a C1) %a)))) (and (= (bvor C1 C2) C1) (not (= (and _let_0 (not (= (bvand %a C2) %a))) _let_0)))))
(check-sat)