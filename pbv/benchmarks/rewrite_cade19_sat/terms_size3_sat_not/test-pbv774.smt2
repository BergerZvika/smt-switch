(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvlshr s (bvshl (bvmul t t) s)) (bvlshr s (bvmul t (bvshl t s))))))
(check-sat)
(exit)