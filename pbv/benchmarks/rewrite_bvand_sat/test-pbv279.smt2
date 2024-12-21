(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand (_ bv1 k) (bvsub (bvor s (_ bv1 k)) t)) (bvsub (_ bv1 k) (bvand t (_ bv1 k))))))
(check-sat)
(exit)