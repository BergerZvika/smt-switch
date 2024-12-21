(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvshl (bvadd s s) s) s) (bvor (bvadd s s) (bvshl s s))))
(check-sat)
(exit)