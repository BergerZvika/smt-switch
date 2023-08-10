(set-logic ALL)
(set-option :produce-models true)
(declare-const k Int)
(declare-const x (_ BitVec k))
(declare-const y (_ BitVec y))
(assert (= x (_ bv0 k)))
(assert (= y (bvor x y)))
(check-sat)
(exit)