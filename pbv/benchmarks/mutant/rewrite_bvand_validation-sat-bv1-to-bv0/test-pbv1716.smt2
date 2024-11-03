(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (_ bv0 k) (bvshl (bvshl (_ bv1 k) (bvand t (_ bv1 k))) t)) (bvand (_ bv1 k) (bvshl (bvnot (bvshl s s)) t))))
(check-sat)
(exit)