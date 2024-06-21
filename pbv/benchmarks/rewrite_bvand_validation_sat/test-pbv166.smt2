(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvshl s (bvand t (_ bv1 k))) (bvshl t t)) (bvshl (bvshl s (bvshl t t)) (bvand t (_ bv1 k))))))
(check-sat)
(exit)