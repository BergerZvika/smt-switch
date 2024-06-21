(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvand s (bvshl (bvand s t) t)) t) (bvshl (bvand s (bvshl t (bvand s t))) t))))
(check-sat)
(exit)