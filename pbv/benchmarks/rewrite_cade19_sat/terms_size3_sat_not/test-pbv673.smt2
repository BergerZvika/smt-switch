(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvlshr s (bvshl (bvor s t) s)) (bvlshr s (bvshl s s)))))
(check-sat)
(exit)