(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand s (bvshl s (bvshl t (bvshl t (_ bv1 k))))) (bvshl s (bvshl t (bvshl t (_ bv1 k)))))))
(check-sat)
(exit)