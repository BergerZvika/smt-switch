(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul s (bvlshr (bvmul s s) s)) (bvlshr s (bvlshr s (bvshl s s)))))
(check-sat)
(exit)