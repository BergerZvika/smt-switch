(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= t (bvsub s (bvshl s t))) (= s (bvsub t (bvshl s t)))))
(check-sat)
(exit)