(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvmul t (bvor s t)) s) (bvmul (bvor s t) (bvshl t s)))))
(check-sat)
(exit)