(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvsub t (bvsub t t))) (bvshl s (bvsub (_ bv0 k) t))))
(check-sat)
(exit)