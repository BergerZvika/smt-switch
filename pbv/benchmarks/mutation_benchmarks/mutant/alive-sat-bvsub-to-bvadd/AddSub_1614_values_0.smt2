(set-logic ALL)
(declare-const k Int)
(declare-fun %Y () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(assert (not (= (bvadd %X (bvadd %X %Y)) (bvsub (_ bv0 k) %Y))))
(check-sat)