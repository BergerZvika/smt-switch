(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvor (bvsub t t) t)) (bvor s (bvor t (bvadd t t)))))
(check-sat)
(exit)