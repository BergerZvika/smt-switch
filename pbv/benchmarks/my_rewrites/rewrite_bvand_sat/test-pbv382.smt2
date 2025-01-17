(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvsub (bvand (_ bv1 k) (bvsub t (_ bv1 k))) s) (bvsub (_ bv1 k) (bvadd s (bvand t (_ bv1 k)))))))
(check-sat)
(exit)