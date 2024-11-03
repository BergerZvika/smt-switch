(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (_ bv0 k) (bvshl (bvnot s) (bvand s (_ bv1 k)))) (bvand (_ bv1 k) (bvnot s))))
(check-sat)
(exit)