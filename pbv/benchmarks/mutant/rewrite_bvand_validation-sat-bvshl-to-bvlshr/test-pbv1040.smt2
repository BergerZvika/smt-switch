(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr s (bvshl (bvshl t (bvand s t)) t)) (bvshl s (bvshl (bvshl t t) (bvand s t)))))
(check-sat)
(exit)