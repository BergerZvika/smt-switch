(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvshl s (bvor t (_ bv1 k))) s) (bvand t (bvlshr (bvadd s s) s))))
(check-sat)
(exit)