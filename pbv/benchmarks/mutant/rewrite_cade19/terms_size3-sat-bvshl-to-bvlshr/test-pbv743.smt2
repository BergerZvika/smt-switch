(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvlshr (bvshl t s) t)) (bvadd s (bvshl (bvshl t s) t))))
(check-sat)
(exit)