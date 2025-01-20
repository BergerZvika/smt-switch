(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvand s t) (bvshl (bvnot s) s)) (bvand s (bvshl t (bvshl (bvnot s) s)))))
(check-sat)
(exit)