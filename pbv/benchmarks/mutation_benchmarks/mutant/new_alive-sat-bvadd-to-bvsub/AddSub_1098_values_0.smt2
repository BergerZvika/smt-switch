(set-logic ALL)
(declare-const k Int)
(declare-fun %b () (_ BitVec k))
(declare-fun %a () (_ BitVec 1))
(assert (not (= (bvsub (pzero_extend (- k 1) %a) %b) (ite (= %a (_ bv1 1)) (bvadd %b (_ bv1 k)) %b))))
(check-sat)