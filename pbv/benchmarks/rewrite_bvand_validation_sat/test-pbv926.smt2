(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand s (bvand (bvshl s s) (bvshl t (_ bv1 k)))) (_ bv0 k))))
(check-sat)
(exit)