(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (distinct t (bvsub t (bvsub s t))) (distinct (_ bv0 k) (bvsub s t)))))
(check-sat)
(exit)