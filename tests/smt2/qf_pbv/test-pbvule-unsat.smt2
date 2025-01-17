(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const m Int)
(declare-const x (_ BitVec k))
(declare-const y (_ BitVec m))
(assert (bvule x y))
(assert (= y (_ bv0 k)))
(assert (distinct x (_ bv0 m)))
(check-sat)
(exit)