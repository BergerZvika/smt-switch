(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd (bvand (_ bv1 k) (bvsub (_ bv1 k) t)) s) (bvsub (_ bv1 k) (bvadd s (bvand t (_ bv1 k))))))
(check-sat)
(exit)