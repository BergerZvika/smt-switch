(set-logic ALL)
(declare-const k Int)
(declare-fun C () (_ BitVec k))
(declare-fun %Op0 () (_ BitVec k))
(assert (let ((_let_0 (bvudiv (ite (= (pextract (- k 1) (- k 1) %Op0) (_ bv1 1)) (bvneg %Op0) %Op0) (ite (= (pextract (- k 1) (- k 1) C) (_ bv1 1)) (bvneg C) C)))) (and (or (not (= %Op0 (bvshl (_ bv1 k) (bvsub (_ bvk k) (_ bv1 k))))) (not (= C (bvnot (_ bv1 k))))) (= C (bvshl (_ bv1 k) (bvsub (_ bvk k) (_ bv1 k)))) (not (= C (_ bv0 k))) (not (= (ite (xor (= (pextract (- k 1) (- k 1) %Op0) (_ bv1 1)) (= (pextract (- k 1) (- k 1) C) (_ bv1 1))) (bvneg _let_0) _let_0) (pzero_extend (- k 1) (ite (= %Op0 C) (_ bv1 1) (_ bv0 1))))))))
(check-sat)