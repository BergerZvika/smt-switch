(set-logic ALL)
(declare-const k Int)
(declare-fun %Y () (_ BitVec k))
(declare-fun %Op1 () (_ BitVec k))
(assert (not (and (bvult %Y (_ bvk k)) (not (= (bvmul (bvshl (_ bv1 k) %Y) %Op1) (bvshl %Op1 %Y))))))
(check-sat)