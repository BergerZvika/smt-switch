(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvnot s) (bvshl (bvshl s t) t)) (bvand (bvnot s) (bvshl s (bvshl t t)))))
(check-sat)
(exit)