(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= t (bvsub s (bvsub s (_ bv1 k)))) (= s (bvsub t (bvsub s (_ bv1 k))))))
(check-sat)
(exit)