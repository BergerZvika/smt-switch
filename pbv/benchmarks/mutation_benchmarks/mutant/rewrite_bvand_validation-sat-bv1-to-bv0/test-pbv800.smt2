(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvand (_ bv0 k) (bvnot (bvshl t s)))) (bvshl s (_ bv1 k))))
(check-sat)
(exit)