(set-logic ALL)
(declare-const k Int)
(declare-fun %b () (_ BitVec k))
(declare-fun %a () (_ BitVec k))
(assert (not (or (bvuge %a %b) (not (= %a %b)))))
(assert true)
(check-sat)