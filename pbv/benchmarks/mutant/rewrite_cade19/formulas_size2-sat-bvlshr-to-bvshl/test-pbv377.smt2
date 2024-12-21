(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsle (bvshl (_ bv0 k) s) t) (bvsle (bvshl s s) t)))
(check-sat)
(exit)