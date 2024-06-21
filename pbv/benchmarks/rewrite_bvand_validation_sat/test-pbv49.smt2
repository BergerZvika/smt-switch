(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand (bvshl (_ bv1 k) s) (bvnot (bvshl t s))) (bvshl (bvand (_ bv1 k) (bvnot t)) s))))
(check-sat)
(exit)