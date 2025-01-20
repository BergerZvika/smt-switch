(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub t (bvadd s (bvshl s s))) (bvadd s (bvadd t (bvshl s s)))))
(check-sat)
(exit)