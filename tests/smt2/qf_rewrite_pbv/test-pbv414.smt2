(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (distinct (bvadd s s) (bvadd s t)) (distinct s (bvadd s (bvsub s t)))))
(check-sat)
(exit)