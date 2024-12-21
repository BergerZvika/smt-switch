(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr s (bvshl (bvshl (bvand t (_ bv1 k)) (_ bv1 k)) t)) (bvshl s (bvshl (bvshl t t) t))))
(check-sat)
(exit)