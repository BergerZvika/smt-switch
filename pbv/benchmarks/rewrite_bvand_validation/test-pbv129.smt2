(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl s (bvand s t)) (bvnot t)) (bvshl s (bvnot (bvand t (bvnot s))))))
(check-sat)
(exit)