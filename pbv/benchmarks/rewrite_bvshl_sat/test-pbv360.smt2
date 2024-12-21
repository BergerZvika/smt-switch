(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvult s (bvshl (bvsub s t) (_ bv1 k))) (bvult s (bvsub t (bvsub s t))))))
(check-sat)
(exit)