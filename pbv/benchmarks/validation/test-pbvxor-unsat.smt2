(set-logic ALL)
(set-option :produce-models true)
(declare-const k Int)
(declare-const x (_ BitVec k))
(declare-const y (_ BitVec k))
(declare-const z (_ BitVec k))
(assert (= x y))
(assert (distinct z (_ bv0 k)))
(assert (= z (bvxor x y)))
(check-sat)
(exit)