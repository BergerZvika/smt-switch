(set-logic ALL)
(declare-const k Int)
(declare-fun %b () (_ BitVec k))
(declare-fun %a () (_ BitVec k))
(assert (not (not (= (and (= %a (_ bv0 k)) (= %b (_ bv0 k))) (= (bvor %a %b) (_ bv0 k))))))
(check-sat)