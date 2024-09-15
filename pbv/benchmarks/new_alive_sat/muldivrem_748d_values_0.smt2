(set-logic ALL)
(declare-const k Int)
(declare-fun C1 () (_ BitVec k))
(declare-fun C2 () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(assert (not (let ((_let_0 (bvmul %X C1))) (let ((_let_1 (bvudiv _let_0 C2))) (and (= (pextract (- (* 2 k) 1) k (bvmul (pzero_extend k %X) (pzero_extend k C1))) (_ bv0 k)) (= (bvmul _let_1 C2) _let_0) (= (bvurem C2 C1) (_ bv0 k)) (not (= C2 (_ bv0 k))) (not (= _let_1 (bvudiv %X (bvudiv C2 C1)))))))))
(check-sat)