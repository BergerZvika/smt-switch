(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvlshr (_ bv1 k) s) (bvshl (bvnot t) s)) (bvand (bvshl (_ bv1 k) s) (bvnot (bvshl t s)))))
(check-sat)
(exit)