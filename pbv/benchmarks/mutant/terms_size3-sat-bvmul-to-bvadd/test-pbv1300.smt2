(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd (bvand s t) (bvshl s t)) (bvmul s (bvshl (bvand s t) t))))
(check-sat)
(exit)