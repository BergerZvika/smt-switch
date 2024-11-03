(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvand s t) (bvlshr s t)) (bvand s (bvand t (bvlshr s t)))))
(check-sat)
(exit)