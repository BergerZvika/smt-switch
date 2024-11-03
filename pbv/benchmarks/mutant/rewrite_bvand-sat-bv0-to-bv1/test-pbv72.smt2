(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub s (bvsub (_ bv1 k) (bvadd s s))) (bvadd s (bvadd s s))))
(check-sat)
(exit)