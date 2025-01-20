(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsle s (bvshl (_ bv1 k) t)) (bvsle s (_ bv0 k))))
(check-sat)
(exit)