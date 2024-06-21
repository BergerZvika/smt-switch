(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand (_ bv1 k) (bvshl (bvshl (bvand s (_ bv1 k)) s) t)) (_ bv0 k))))
(check-sat)
(exit)