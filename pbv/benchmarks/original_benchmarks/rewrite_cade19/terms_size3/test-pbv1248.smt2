(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvadd s t) (bvor s t)) (bvor s (bvor t (bvadd s t)))))
(check-sat)
(exit)