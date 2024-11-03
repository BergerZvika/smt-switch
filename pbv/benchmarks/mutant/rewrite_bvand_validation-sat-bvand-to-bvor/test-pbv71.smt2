(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvshl (_ bv1 k) s) (bvshl (bvnot s) (_ bv1 k))) (bvshl (bvshl s s) (bvshl (bvnot s) s))))
(check-sat)
(exit)