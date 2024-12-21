(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvand s (bvshl (bvand t (_ bv1 k)) t)) (_ bv1 k)) (bvshl (bvand s (bvshl t t)) t))))
(check-sat)
(exit)