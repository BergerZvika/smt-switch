(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvshl (bvand (_ bv1 k) (bvshl (_ bv1 k) t)) t) s) (bvand (bvshl (_ bv1 k) s) (bvshl (bvshl (_ bv1 k) s) t)))))
(check-sat)
(exit)