(set-logic ALL)
(declare-const k Int)
(declare-fun %X () (_ BitVec k))
(assert (let ((_let_0 (bvudiv (ite (= (pextract (- k 1) (- k 1) %X) (_ bv1 1)) (bvneg %X) %X) (ite (= (pextract (- k 1) (- k 1) (bvneg (_ bv0 k))) (_ bv1 1)) (bvneg (bvnot (_ bv0 k))) (bvnot (_ bv0 k)))))) (and (or (not (= %X (bvshl (_ bv1 k) (bvsub (_ bvk k) (_ bv1 k))))) (not (= (bvnot (_ bv0 k)) (bvnot (_ bv0 k))))) (not (= (bvnot (_ bv0 k)) (_ bv0 k))) (not (= (ite (xor (= (pextract (- k 1) (- k 1) %X) (_ bv1 1)) (= (pextract (- k 1) (- k 1) (bvnot (_ bv0 k))) (_ bv1 1))) (bvneg _let_0) _let_0) (bvsub (_ bv0 k) %X))))))
(check-sat)