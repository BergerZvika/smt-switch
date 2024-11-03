(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvand (_ bv0 k) (bvshl t (bvand s (_ bv1 k))))) (bvshl s (bvand t (bvand (_ bv1 k) (bvnot s))))))
(check-sat)
(exit)