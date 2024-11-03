(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvand (bvsub s t) t) t) (bvshl (bvand (bvnot s) t) t)))
(check-sat)
(exit)