(set-logic ALL)
(declare-const k Int)
(declare-fun %a () (_ BitVec k))
(assert (not (= (bvsub (_ bv15 k) %a) (bvxor %a (_ bv15 k)))))
(assert true)
(check-sat)