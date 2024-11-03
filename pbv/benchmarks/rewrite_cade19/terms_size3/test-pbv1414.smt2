(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvmul s (bvadd s s)) s) (bvmul s (bvlshr (bvadd s s) s))))
(check-sat)
(exit)