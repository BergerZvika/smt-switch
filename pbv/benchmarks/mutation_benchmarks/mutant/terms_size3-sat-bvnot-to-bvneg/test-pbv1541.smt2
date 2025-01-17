(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvand (bvadd s t) t) t) (bvshl (bvand (bvneg s) t) t)))
(check-sat)
(exit)