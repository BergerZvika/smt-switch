(set-logic ALL)
(declare-const k Int)
(declare-fun %b () (_ BitVec k))
(declare-fun %a () (_ BitVec k))
(assert (not (= (bvxor (bvadd %a %b) (bvor %a %b)) (bvxor %a %b))))
(check-sat)