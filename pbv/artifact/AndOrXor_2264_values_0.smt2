(set-logic ALL)
(declare-const k Int)
(declare-fun %B () (_ BitVec k))
(declare-fun %A () (_ BitVec k))
(assert (not (= (bvor %A (bvxor (bvxor %A (_ bv15 k)) %B)) (bvor %A (bvxor %B (_ bv15 k))))))
(assert true)
(check-sat)