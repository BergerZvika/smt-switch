(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvor t (bvadd s (bvshl s s))) (bvor s (bvor t (bvshl s s))))))
(check-sat)
(exit)