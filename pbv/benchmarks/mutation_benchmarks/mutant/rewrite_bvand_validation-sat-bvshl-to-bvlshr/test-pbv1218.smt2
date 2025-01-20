(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand t (bvlshr s (bvshl (bvshl s t) t))) (bvand s (bvshl t (bvshl (bvshl s t) t)))))
(check-sat)
(exit)