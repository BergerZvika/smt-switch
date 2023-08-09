(set-logic ALL)
(declare-const k Int)
(declare-fun %b () (_ BitVec k))
(declare-fun %a () (_ BitVec k))
(assert (not (= (bvadd (bvsub (_ bv0 k) %a) (bvsub (_ bv0 k) %b)) (bvsub (_ bv0 k) (bvadd %a %b)))))
(check-sat)