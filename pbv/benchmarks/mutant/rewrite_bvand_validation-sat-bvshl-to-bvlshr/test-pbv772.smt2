(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr s (bvand t (bvshl (bvshl t (_ bv1 k)) s))) (bvshl s (bvand t (bvshl (bvshl t s) (_ bv1 k))))))
(check-sat)
(exit)