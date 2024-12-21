(set-logic ALL)
(declare-const k Int)
(declare-const m Int)
(declare-fun C2 () (_ BitVec k))
(declare-fun C1 () (_ BitVec m))
(declare-fun %X () (_ BitVec m))
(assert (> m k))
(assert (let ((_let_0 (bvshl %X C1))) (let ((_let_1 (pzero_extend (- m k) C2))) (and (bvult C1 (_ bvm m)) (bvult C2 (_ bvk k)) (not (= (bvshl (pextract (- k 1) 0 _let_0) C2) (pextract (- k 1) 0 (bvand (bvshl _let_0 _let_1) (bvshl (bvadd (bvshl (_ bv1 m) (_ bvk m)) (_ bv1 m)) _let_1)))))))))
(check-sat)