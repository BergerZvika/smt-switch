(set-logic ALL)
(declare-const k Int)
(declare-fun %b () (_ BitVec k))
(declare-fun %a () (_ BitVec k))
(assert (not (= (bvxor (bvor %a (bvxor %b (_ bv15 k))) (bvor (bvxor %a (_ bv15 k)) %b)) (bvxor %a %b))))
(check-sat)