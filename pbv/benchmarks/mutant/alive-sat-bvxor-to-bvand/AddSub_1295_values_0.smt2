(set-logic ALL)
(declare-const k Int)
(declare-fun %b () (_ BitVec k))
(declare-fun %a () (_ BitVec k))
(assert (not (= (bvadd (bvand %a %b) (bvand %a %b)) (bvor %a %b))))
(check-sat)