(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= s (bvshl (bvsub s (_ bv1 k)) (_ bv1 k))) (= s (bvsub (_ bv0 k) (bvshl (_ bv1 k) (_ bv1 k))))))
(check-sat)
(exit)