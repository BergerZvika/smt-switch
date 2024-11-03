(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr s (bvshl (bvshl t (bvand t (_ bv1 k))) s)) (bvshl s (bvshl (bvshl t s) (bvand t (_ bv1 k))))))
(check-sat)
(exit)