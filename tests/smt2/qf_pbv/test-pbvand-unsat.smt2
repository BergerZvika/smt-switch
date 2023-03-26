(set-logic ALL)
(set-option :produce-models true)
(declare-const k Int)
(declare-const x (_ BitVec k))
(declare-const y (_ BitVec k))
(declare-const z (_ BitVec k))
(assert (= x (_ bv0 8)))
(assert (distinct z (_ bv0 8)))
(assert (= z (bvand x y)))
(check-sat)
(exit)