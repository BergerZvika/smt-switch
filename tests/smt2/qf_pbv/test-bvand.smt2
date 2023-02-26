(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const m Int)
(declare-const r Int)
(declare-const x (_ BitVec (r)))
(declare-const y (_ BitVec k))
(declare-const z (_ BitVec m))
(assert (= z (bvand x y)))
(check-sat)
(exit)