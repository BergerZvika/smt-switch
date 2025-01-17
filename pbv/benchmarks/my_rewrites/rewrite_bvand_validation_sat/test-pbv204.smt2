(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvand (_ bv1 k) (bvshl s t)) (bvshl t t)) (bvand (_ bv1 k) (bvshl s t)))))
(check-sat)
(exit)