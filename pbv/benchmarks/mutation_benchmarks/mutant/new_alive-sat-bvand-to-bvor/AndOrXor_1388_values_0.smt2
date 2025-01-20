(set-logic ALL)
(declare-const k Int)
(declare-fun %b () (_ BitVec k))
(declare-fun %a () (_ BitVec 1))
(assert (not (= (bvor (psign_extend (- k 1) %a) %b) (ite (= %a (_ bv1 1)) %b (_ bv0 k)))))
(check-sat)