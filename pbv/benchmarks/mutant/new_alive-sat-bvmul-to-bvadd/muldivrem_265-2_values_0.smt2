(set-logic ALL)
(declare-const k Int)
(declare-fun %X () (_ BitVec k))
(declare-fun %Y () (_ BitVec k))
(assert (let ((_let_0 (bvudiv (ite (= (pextract (- k 1) (- k 1) %X) (_ bv1 1)) (bvneg %X) %X) (ite (= (pextract (- k 1) (- k 1) %Y) (_ bv1 1)) (bvneg %Y) %Y)))) (let ((_let_1 (= (bvadd (ite (xor (= (pextract (- k 1) (- k 1) %X) (_ bv1 1)) (= (pextract (- k 1) (- k 1) %Y) (_ bv1 1))) (bvneg _let_0) _let_0) %Y) %X))) (and (or (not (= %X (bvshl (_ bv1 k) (bvsub (_ bvk k) (_ bv1 k))))) (not (= %Y (bvnot (_ bv0 k))))) _let_1 (not (= %Y (_ bv0 k))) (not _let_1)))))
(check-sat)