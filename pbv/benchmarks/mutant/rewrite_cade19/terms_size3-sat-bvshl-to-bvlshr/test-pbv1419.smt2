(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvor s (bvadd s s)) s) (bvshl (bvadd s (bvadd s s)) s)))
(check-sat)
(exit)