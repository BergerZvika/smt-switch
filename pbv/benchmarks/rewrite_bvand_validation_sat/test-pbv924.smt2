(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl s (bvshl (bvshl s s) (bvand s (_ bv1 k)))) (bvshl s (bvshl (bvnot s) s)))))
(check-sat)
(exit)