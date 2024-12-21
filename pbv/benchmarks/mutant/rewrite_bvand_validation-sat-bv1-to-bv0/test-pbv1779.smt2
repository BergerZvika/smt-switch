(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl s s) (bvshl t (bvand t (_ bv0 k)))) (bvshl (bvshl s s) (bvshl t (bvand s t)))))
(check-sat)
(exit)