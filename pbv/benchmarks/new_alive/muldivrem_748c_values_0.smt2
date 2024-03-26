(set-logic ALL)
(declare-const k Int)
(declare-fun C1 () (_ BitVec k))
(declare-fun C2 () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(assert (and (= (pextract (* 2 k) k (bvmul (pzero_extend k %X) (pzero_extend k C1))) (_ bv0 k)) (= (bvurem C2 C1) (_ bv0 k)) (not (= C2 (_ bv0 k))) (not (= (bvudiv (bvmul %X C1) C2) (bvudiv %X (bvudiv C2 C1))))))
(check-sat)