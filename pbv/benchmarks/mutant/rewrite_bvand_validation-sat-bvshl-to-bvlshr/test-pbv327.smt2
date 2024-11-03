(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvshl s (bvand t (bvshl t s))) t) (bvshl (bvshl s t) (bvand t (bvshl t s)))))
(check-sat)
(exit)