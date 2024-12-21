(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const m Int)
(declare-const r Int)
(declare-const x (_ BitVec k))
(declare-const y (_ BitVec k))
(declare-const z (_ BitVec k))
(assert (= x (_ bv0 k)))
(assert (= (bvudiv x y) z))
(assert (distinct z (_ bv0 k)))
(check-sat)
(exit)