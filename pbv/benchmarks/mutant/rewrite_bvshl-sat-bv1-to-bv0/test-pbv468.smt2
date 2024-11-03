(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (distinct t (bvsub (_ bv0 k) (bvsub s (_ bv1 k)))) (distinct s (bvsub (_ bv1 k) (bvsub t (_ bv1 k))))))
(check-sat)
(exit)