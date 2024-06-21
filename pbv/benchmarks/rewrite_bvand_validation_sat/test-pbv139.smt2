(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvand s (bvshl s (_ bv1 k))) (bvshl s s)) (bvand s (bvshl (bvshl s (_ bv1 k)) (bvshl s s))))))
(check-sat)
(exit)