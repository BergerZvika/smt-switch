(set-logic ALL)
(declare-const k Int)
(declare-fun %b () (_ BitVec k))
(declare-fun %a () (_ BitVec k))
(assert (not (= (bvxor (bvand %a (bvxor %b (_ bv15 k))) (bvand (bvxor %a (_ bv15 k)) %b)) (bvxor %a %b))))
(check-sat)