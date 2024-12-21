(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvand s t) (bvand (_ bv1 k) (bvshl t s))) (bvand s t))))
(check-sat)
(exit)