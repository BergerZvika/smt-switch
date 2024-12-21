(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvor s (bvshl t t)) (bvshl s (_ bv1 k))) (bvand (bvshl t t) (bvshl s (bvshl s (_ bv1 k))))))
(check-sat)
(exit)