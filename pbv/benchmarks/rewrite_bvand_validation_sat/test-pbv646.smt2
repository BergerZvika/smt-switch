(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand s (bvshl t (bvshl s (bvshl (_ bv1 k) t)))) (bvand s (bvshl t (bvshl s (bvshl t t)))))))
(check-sat)
(exit)