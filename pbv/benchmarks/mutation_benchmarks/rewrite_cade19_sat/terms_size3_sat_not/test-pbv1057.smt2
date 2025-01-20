(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvor t (bvor s (bvlshr s t))) (bvor s (bvor t (bvlshr s t))))))
(check-sat)
(exit)