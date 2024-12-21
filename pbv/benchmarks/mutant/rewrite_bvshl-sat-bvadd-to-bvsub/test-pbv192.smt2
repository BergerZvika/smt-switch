(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (distinct (_ bv0 k) (bvsub s t)) (distinct t (bvsub (_ bv0 k) s))))
(check-sat)
(exit)