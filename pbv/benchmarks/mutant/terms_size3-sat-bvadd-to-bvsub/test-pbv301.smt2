(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvsub s (bvshl t s))) (bvadd s (bvshl t s))))
(check-sat)
(exit)