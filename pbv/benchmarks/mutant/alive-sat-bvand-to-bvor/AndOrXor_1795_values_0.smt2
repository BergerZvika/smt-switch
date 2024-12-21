(set-logic ALL)
(declare-const k Int)
(declare-fun C1 () (_ BitVec k))
(declare-fun C2 () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(assert (let ((_let_0 (bvxor C1 C2))) (and (bvult C1 C2) (= (bvor _let_0 (bvsub _let_0 (_ bv1 k))) (_ bv0 k)) (not (= (or (= %X C1) (= %X C2)) (= (bvand %X (bvnot _let_0)) C1))) (not (= _let_0 (_ bv0 k))))))
(check-sat)