(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand t (bvlshr s (bvand s (bvshl s t)))) (bvand s (bvshl t (bvand s (bvshl s t))))))
(check-sat)
(exit)