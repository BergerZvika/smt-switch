(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvadd s s) (bvadd t t)) (bvshl (bvand s t) (_ bv1 k))))
(check-sat)
(exit)