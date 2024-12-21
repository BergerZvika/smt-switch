(set-logic ALL)
(declare-const k Int)
(declare-fun C2 () (_ BitVec k))
(declare-fun %B () (_ BitVec k))
(declare-fun %A () (_ BitVec k))
(declare-fun C1 () (_ BitVec k))
(assert (let ((_let_0 (bvadd C2 (_ bv1 k)))) (and (= (bvadd _let_0 (bvsub _let_0 (_ bv1 k))) (_ bv0 k)) (= (bvand C1 C2) (_ bv0 k)) (not (= (bvand (bvadd (bvor %A C1) %B) C2) (bvand (bvadd %A %B) C2))))))
(check-sat)