(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvlshr (bvlshr (bvadd s s) s) t) (bvlshr (bvadd s (bvlshr s t)) s))))
(check-sat)
(exit)