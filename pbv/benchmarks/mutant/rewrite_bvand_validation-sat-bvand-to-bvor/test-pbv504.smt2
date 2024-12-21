(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl (bvor s (_ bv1 k)) (bvshl t s)) t) (bvshl (bvshl (bvand s (_ bv1 k)) t) (bvshl t s))))
(check-sat)
(exit)