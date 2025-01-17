(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub s (bvor t (bvnot s))) (bvnot (bvneg (bvand s t)))))
(check-sat)
(exit)