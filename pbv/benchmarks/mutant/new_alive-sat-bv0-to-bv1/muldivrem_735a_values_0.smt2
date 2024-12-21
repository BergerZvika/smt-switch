(set-logic ALL)
(declare-const k Int)
(declare-fun C2 () (_ BitVec k))
(declare-fun C1 () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(assert (let ((_let_0 (bvmul C1 C2))) (let ((_let_1 (bvudiv (ite (= (pextract (- k 1) (- k 1) %X) (_ bv1 1)) (bvneg %X) %X) (ite (= (pextract (- k 1) (- k 1) _let_0) (_ bv1 1)) (bvneg _let_0) _let_0)))) (let ((_let_2 (bvudiv (ite (= (pextract (- k 1) (- k 1) %X) (_ bv1 1)) (bvneg %X) %X) (ite (= (pextract (- k 1) (- k 1) C1) (_ bv1 1)) (bvneg C1) C1)))) (let ((_let_3 (ite (xor (= (pextract (- k 1) (- k 1) %X) (_ bv1 1)) (= (pextract (- k 1) (- k 1) C1) (_ bv1 1))) (bvneg _let_2) _let_2))) (let ((_let_4 (bvudiv (ite (= (pextract (- k 1) (- k 1) _let_3) (_ bv1 1)) (bvneg _let_3) _let_3) (ite (= (pextract (- k 1) (- k 1) C2) (_ bv1 1)) (bvneg C2) C2)))) (and (or (not (= %X (bvshl (_ bv1 k) (bvsub (_ bvk k) (_ bv1 k))))) (not (= C1 (bvnot (_ bv1 k))))) (or (not (= _let_3 (bvshl (_ bv1 k) (bvsub (_ bvk k) (_ bv1 k))))) (not (= C2 (bvnot (_ bv0 k))))) (= (bvmul (psign_extend k C1) (psign_extend k C2)) (psign_extend k _let_0)) (not (= C1 (_ bv0 k))) (not (= C2 (_ bv0 k))) (not (= (ite (xor (= (pextract (- k 1) (- k 1) _let_3) (_ bv1 1)) (= (pextract (- k 1) (- k 1) C2) (_ bv1 1))) (bvneg _let_4) _let_4) (ite (xor (= (pextract (- k 1) (- k 1) %X) (_ bv1 1)) (= (pextract (- k 1) (- k 1) _let_0) (_ bv1 1))) (bvneg _let_1) _let_1))))))))))
(check-sat)