(set-logic ALL)
(declare-const k Int)
(declare-fun C1 () (_ BitVec k))
(declare-fun C2 () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(assert (let ((_let_0 (bvshl %X C1))) (let ((_let_1 (bvand C2 (bvshl (bvnot (_ bv1 k)) C1)))) (and (bvult C1 (_ bvk k)) (not (= _let_1 (bvshl (bvnot (_ bv0 k)) C1))) (not (= _let_1 C2)) (not (= (bvand _let_0 C2) (bvand _let_0 _let_1)))))))
(check-sat)