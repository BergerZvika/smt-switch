(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvand t (bvshl t (bvshl s s)))) (bvand s (bvshl t (bvshl s s)))))
(check-sat)
(exit)