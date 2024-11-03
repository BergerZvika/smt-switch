(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvlshr s s) (bvnot (bvshl (_ bv1 k) (_ bv1 k)))) (bvand (bvshl s s) (bvnot (bvshl s (_ bv1 k))))))
(check-sat)
(exit)