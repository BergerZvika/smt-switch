(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (_ bv1 k) (bvlshr (bvadd s t) s)) (bvand (_ bv1 k) (bvshl t s))))
(check-sat)
(exit)