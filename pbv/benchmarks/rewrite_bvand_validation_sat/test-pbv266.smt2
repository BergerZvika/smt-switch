(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvnot (bvshl (bvand s t) (_ bv1 k))) t) (bvshl (bvnot (bvshl (bvand s t) t)) t))))
(check-sat)
(exit)