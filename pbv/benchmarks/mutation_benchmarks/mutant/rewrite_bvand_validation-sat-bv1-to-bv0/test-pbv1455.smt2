(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (_ bv0 k) (bvlshr (bvshl s s) (_ bv1 k))) (bvlshr s (bvand s (bvnot (_ bv1 k))))))
(check-sat)
(exit)