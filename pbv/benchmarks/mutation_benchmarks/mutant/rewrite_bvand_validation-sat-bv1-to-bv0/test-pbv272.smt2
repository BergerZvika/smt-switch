(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvand s (bvnot (bvshl s (_ bv0 k)))) s) (bvshl s s)))
(check-sat)
(exit)