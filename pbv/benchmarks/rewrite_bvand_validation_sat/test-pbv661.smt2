(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand s (bvand t (bvshl t (bvshl t t)))) (bvand s (bvand t (bvshl s (bvshl t t)))))))
(check-sat)
(exit)