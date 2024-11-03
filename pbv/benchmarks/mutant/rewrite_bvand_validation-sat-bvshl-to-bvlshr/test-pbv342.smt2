(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvshl s (bvand (_ bv1 k) (bvnot s))) t) (bvshl (bvshl s t) (bvand (_ bv1 k) (bvnot s)))))
(check-sat)
(exit)