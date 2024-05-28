(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvlshr (bvadd s (_ bv1 k)) (_ bv1 k)) s) (bvand (bvadd s s) (bvshl (_ bv1 k) s))))
(check-sat)
(exit)