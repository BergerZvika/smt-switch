(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl s (bvshl (bvand (_ bv1 k) (bvshl t t)) (_ bv1 k))) s)))
(check-sat)
(exit)