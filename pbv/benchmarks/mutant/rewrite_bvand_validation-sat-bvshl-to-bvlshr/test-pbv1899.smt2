(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvlshr s t) (bvshl (bvshl t s) (_ bv1 k))) (bvand (bvshl s t) (bvshl t (bvshl s s)))))
(check-sat)
(exit)