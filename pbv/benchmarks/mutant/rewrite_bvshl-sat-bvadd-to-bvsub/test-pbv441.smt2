(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (distinct t (bvsub s (bvshl (_ bv1 k) (_ bv1 k)))) (distinct s (bvsub t (bvshl (_ bv1 k) (_ bv1 k))))))
(check-sat)
(exit)