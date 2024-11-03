(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvshl s s) (bvshl s (bvand s (_ bv1 k)))) (bvshl (bvshl s s) (bvshl s s))))
(check-sat)
(exit)