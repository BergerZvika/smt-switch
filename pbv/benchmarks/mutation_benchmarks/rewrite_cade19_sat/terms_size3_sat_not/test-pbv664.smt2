(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvor s (bvlshr (bvmul s s) s)) (bvor s (bvlshr (bvadd s s) s)))))
(check-sat)
(exit)