(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= s (bvshl s (bvsub (_ bv1 k) t))) (= s (bvshl s t))))
(check-sat)
(exit)